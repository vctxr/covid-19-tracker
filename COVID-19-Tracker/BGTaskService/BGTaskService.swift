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
    
    func scheduleTasks() {
        refreshService.scheduleAppRefresh(shouldScheduleASAP: true)
    }
}
