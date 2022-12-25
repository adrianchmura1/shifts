//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation
import ShiftsDomain

extension ShiftsViewModel {
    struct ShiftsSectionPresentable: Equatable {
        let title: String

        init(from domain: ShiftDay) {
            title = domain.date
        }
    }
}
