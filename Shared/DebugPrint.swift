//
//  DebugPrint.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

func debugPrint(_ items: Any...) {
    #if DEBUG
    items.forEach { item in
        print(item)
    }
    #endif
}
