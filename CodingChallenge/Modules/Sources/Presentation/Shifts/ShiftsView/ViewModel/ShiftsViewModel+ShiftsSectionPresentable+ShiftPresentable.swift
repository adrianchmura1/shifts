//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsViewModel.ShiftsSectionPresentable {
    struct ShiftPresentable: Equatable, Hashable {
        let shiftId: Int
        let start: String
        let end: String
        let specialty: String
        let details: ShiftDetailsPresentable
    }
}
