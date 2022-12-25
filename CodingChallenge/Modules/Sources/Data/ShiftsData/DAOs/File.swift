//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

struct ShiftsResponse: Decodable {
    let data: [ShiftsDataResponse]
}

extension ShiftsResponse {
    struct ShiftsDataResponse: Decodable {
        let date: String
        let shifts: [ShiftResponse]
    }
}

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

extension ShiftsResponse.ShiftsDataResponse.ShiftResponse {
    struct FacilityType: Decodable {
        let id: Int
        let name: String
        let color: String
    }
}

extension ShiftsResponse.ShiftsDataResponse.ShiftResponse {
    struct Skill: Decodable {
        let id: Int
        let name: String
        let color: String
    }
}

extension ShiftsResponse.ShiftsDataResponse.ShiftResponse {
    struct LocalizedSpecialty: Decodable {
        let id: Int
        let specialty_id: Int
        let state_id: Int
        let name: String
    }

}
