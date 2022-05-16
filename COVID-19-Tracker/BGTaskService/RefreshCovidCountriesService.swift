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
        task.expirationHandler = { [weak self] in
            guard let self = self else { return }
            
            debugPrint("❌ Refresh expired")
            
            #if DEBUG
            self.showLocalNotification(message: "❌ Refresh expired")
            #endif
            
            self.scheduleAppRefresh(shouldScheduleASAP: true)
            operationQueue.cancelAllOperations()
        }
        
        // Inform the system that the background task is complete when the operation completes.
        saveCovidCountriesToDiskOperation.onResult = { [weak self] result in
            guard let self = self else { return }
            
            debugPrint("🔄 Refresh completed with: \(result)")
            
            switch result {
            case .success:
                #if DEBUG
                self.showLocalNotification(message:  "✅ Refresh success")
                #endif

                WidgetCenter.shared.reloadAllTimelines()    // Reload widget to reflect new data.
                task.setTaskCompleted(success: true)
            case .failure(let error):
                #if DEBUG
                self.showLocalNotification(message:  "❌ Refresh failed: \(error.localizedDescription)")
                #endif

                // Schedule a new refresh task ASAP because we failed.
                self.scheduleAppRefresh(shouldScheduleASAP: true)
                task.setTaskCompleted(success: false)
            }
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
                // Fetch no earlier than one hour from now.
                return Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
            }
        }()
        
        request.earliestBeginDate = earliestBeginDate
        debugPrint("📝 Scheduling app refresh: \(taskIdentitifier), earliest: \(earliestBeginDate.description(with: .current))")
        
        #if DEBUG
        showLocalNotification(message: "📝 Scheduling app refresh: \(taskIdentitifier), earliest: \(earliestBeginDate.description(with: .current))")
        #endif
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            debugPrint("❌ Could not schedule app refresh: \(error.localizedDescription)")
        }
    }
    
    #if DEBUG
    func showLocalNotification(message: String) {
        let content = UNMutableNotificationContent()
        content.title = "Background app refresh"
        content.body = message
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            guard let error = error else { return }
            debugPrint("❌ \(error.localizedDescription)")
        }
    }
    #endif
}
