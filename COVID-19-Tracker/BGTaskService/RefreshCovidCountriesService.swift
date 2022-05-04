//
//  RefreshCovidCountriesService.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import BackgroundTasks
import Networking
import WidgetKit
import UIKit

class RefreshCovidCountriesService {
    /// The `BGRefreshTask` identifier permitted in the `Info.plist`.
    let taskIdentitifier = "com.example.COVID-19-Tracker.refresh"
    
    /// The background task identifier.
    var backgroundTaskID: UIBackgroundTaskIdentifier?

    /// Performs an app refresh operation.
    func handleAppRefresh(task: BGAppRefreshTask) {
        // Schedule a new refresh task.
        scheduleAppRefresh(shouldScheduleASAP: false)

        // Create the operations that performs the main part of the background task.
        let operationQueue = OperationQueue()
        let fetchCovidCountriesOperation = FetchCovidCountriesOperation()
        let saveCovidCountriesToDiskOperation = SaveCovidCountriesToDiskOperation()
        saveCovidCountriesToDiskOperation.addDependency(fetchCovidCountriesOperation)
        
        // Provide the background task with an expiration handler that cancels the operation.
        task.expirationHandler = {
            debugPrint("❌ Refresh expired")
            
            // TODO: REMOVE THIS, FOR DEBUG PURPOSES ONLY!
            let content = UNMutableNotificationContent()
            content.title = "Background app refersh"
            content.body = "❌ Refresh expired"
            let request = UNNotificationRequest(identifier: "BGAppRefreshTaskExpired", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request)
            
            operationQueue.cancelAllOperations()
        }
        
        // Inform the system that the background task is complete when the operation completes.
        saveCovidCountriesToDiskOperation.onResult = { [weak self] result in
            guard let self = self else { return }
            
            debugPrint("🔄 Refresh completed with: \(result)")
            
            // TODO: REMOVE THIS, FOR DEBUG PURPOSES ONLY!
            let content = UNMutableNotificationContent()
            content.title = "Background app refersh"
            content.body = "🔄 Refresh completed with: \(result)"
            let request = UNNotificationRequest(identifier: "BGAppRefreshTaskDone", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request)
            
            switch result {
            case .success:
                WidgetCenter.shared.reloadAllTimelines()    // Reload widget to reflect new data.
                task.setTaskCompleted(success: true)
            case .failure:
                // Schedule a new refresh task ASAP because we failed.
                self.scheduleAppRefresh(shouldScheduleASAP: true)
                task.setTaskCompleted(success: false)
            }
            
            UIApplication.shared.endBackgroundTask(self.backgroundTaskID!)
            self.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
        }
        
        // Request for extended execution time in the background for network request.
        backgroundTaskID = UIApplication.shared.beginBackgroundTask {
            // End the task if time expires.
            UIApplication.shared.endBackgroundTask(self.backgroundTaskID!)
            self.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
        }
        
        // Start the operations.
        debugPrint("🏃‍♀️ Starting refresh operation")
        operationQueue.addOperations([fetchCovidCountriesOperation, saveCovidCountriesToDiskOperation], waitUntilFinished: false)
    }
    
    /// Schedule a new `BGAppRefreshTask`.
    func scheduleAppRefresh(shouldScheduleASAP: Bool) {
        let request = BGAppRefreshTaskRequest(identifier: taskIdentitifier)
        
        let earliestBeginDate: Date = {
            // TODO: Revert these dates later, for development purposes only!
            if shouldScheduleASAP {
                // Fetch no earlier than 15 mins from now.
                return Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
            } else {
                // Fetch no earlier than tomorrow midgnight.
//                let tomorrow = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
//                return Calendar.current.startOfDay(for: tomorrow)
                return Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
            }
        }()
        
        request.earliestBeginDate = earliestBeginDate
        debugPrint("📝 Scheduling app refresh: \(taskIdentitifier), earliest: \(earliestBeginDate.description(with: .current))")
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            debugPrint("❌ Could not schedule app refresh: \(error.localizedDescription)")
        }
    }
}
