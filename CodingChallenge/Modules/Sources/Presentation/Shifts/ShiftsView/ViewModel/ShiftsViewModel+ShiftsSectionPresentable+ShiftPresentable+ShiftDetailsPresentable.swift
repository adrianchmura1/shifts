//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable {
    struct ShiftDetailsPresentable: Equatable, Hashable {
        let shiftId: Int
        let start: String
        let end: String
        let specialty: String
        let kind: String
        let timezone: String
        let skill: String
        let distance: String
    }
}
