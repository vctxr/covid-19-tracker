//
//  BGTaskService.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import BackgroundTasks

final class BGTaskService {
    // MARK: - Variables 📦
    
    static let shared = BGTaskService()
    
    private let refreshService = RefreshCovidCountriesService()
        
    // MARK: - Inits 🐣
    
    private init() {}
    
    func registerTasks() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: refreshService.taskIdentitifier, using: nil) { [refreshService] task in
            refreshService.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
    }
    
    func scheduleTasksIfNeeded() {
        BGTaskScheduler.shared.getPendingTaskRequests { [refreshService] tasks in
            #if DEBUG
            tasks.forEach { task in
                debugPrint("Pending task: \(task.identifier), earliest: \(task.earliestBeginDate?.description(with: .current) ?? "-")")
                
                refreshService.showLocalNotification(message: "🟠 Pending task: \(task.identifier), earliest: \(task.earliestBeginDate?.description(with: .current) ?? "-")")
            }
            #endif
            
            // Only schedule new app refresh task if the current pending task request doesnt already contain it.
            if !tasks.contains(where: { $0.identifier == refreshService.taskIdentitifier }) {
                refreshService.scheduleAppRefresh(shouldScheduleASAP: true)
            }
        }
    }
}
