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
        let shifts: [ShiftPresentable]

        init(from domain: ShiftDay) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d"
            title = formatter.string(from: domain.date)
            shifts = domain.shifts.map {
                ShiftPresentable(shiftId: $0.id,
                                 start: $0.start.formatted(),
                                 end: $0.end.formatted(),
                                 specialty: $0.localizedSpecialty.name,
                                 details: .init(shiftId: $0.id,
                                                start: $0.start.formatted(),
                                                end: $0.end.formatted(),
                                                specialty: $0.localizedSpecialty.name,
                                                kind: $0.kind,
                                                timezone: $0.timezone,
                                                skill: $0.skill.name))
            }
        }
    }
}

extension ShiftsViewModel.ShiftsSectionPresentable {
    struct ShiftPresentable: Equatable, Hashable {
        let shiftId: Int
        let start: String
        let end: String
        let specialty: String
        let details: ShiftDetailsPresentable
    }
}

extension ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable {
    struct ShiftDetailsPresentable: Equatable, Hashable {
        let shiftId: Int
        let start: String
        let end: String
        let specialty: String
        let kind: String
        let timezone: String
        let skill: String
    }
}
