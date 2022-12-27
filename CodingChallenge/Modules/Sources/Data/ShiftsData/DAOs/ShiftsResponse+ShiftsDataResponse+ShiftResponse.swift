//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsResponse.ShiftsDataResponse {
    struct ShiftResponse: Decodable {
        let shift_id: Int
        let start_time: Date
        let end_time: Date
        let timezone: String
        let shift_kind: String
        let within_distance: Int
        let facility_type: FacilityType
        let skill: Skill
        let localized_specialty: LocalizedSpecialty
    }
}
