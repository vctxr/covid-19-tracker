//
//  CountryCovidCard+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 24/04/22.
//

import SwiftUI

// MARK: - State

struct CountryCovidCardState: Equatable, Identifiable {
    var id: String { data.id }
    
    let data: CountryCovidTimeseries
    let style: Style
}

extension CountryCovidCardState {
    enum Style {
        case first
        case second
        case third
        case normal
        
        init(index: Int) {
            switch index {
            case 0:
                self = .first
            case 1:
                self = .second
            case 2:
                self = .third
            default:
                self = .normal
            }
        }
        
        internal var countryTextColor: Color {
            switch self {
            case .first, .second, .third:
                return .white
            case .normal:
                return .primary
            }
        }
        
        internal var confirmedTextColor: Color {
            switch self {
            case .first, .second, .third:
                return .white
            case .normal:
                return .secondary
            }
        }
        
        internal var backgroundColor: Color {
            switch self {
            case .first:
                let color = Color(hex: "F6412D")
                return Color(light: color, dark: color.opacity(0.95))
            case .second:
                let color = Color(hex: "FF9800")
                return Color(light: color, dark: color.opacity(0.95))
            case .third:
                let color = Color(hex: "FFC100")
                return Color(light: color, dark: color.opacity(0.95))
            case .normal:
                return Color(uiColor: .systemBackground)
            }
        }
    }
}
