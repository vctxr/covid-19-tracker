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
        
    // MARK: - Inits 🐣
    
    private init() {}
    
    func registerTasks() {
        let refreshService = RefreshCovidCountriesService()
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: refreshService.taskIdentitifier, using: nil) { task in
            refreshService.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
        
        refreshService.scheduleAppRefresh(shouldScheduleASAP: true)
    }
}
