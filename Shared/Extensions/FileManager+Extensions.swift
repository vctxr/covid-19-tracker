//
//  FileManager+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

extension FileManager {
    func sharedContainerURL() -> URL {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.COVID-19-Tracker")!
    }
}
