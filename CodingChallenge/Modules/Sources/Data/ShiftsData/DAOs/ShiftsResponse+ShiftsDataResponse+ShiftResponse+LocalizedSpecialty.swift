//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsResponse.ShiftsDataResponse.ShiftResponse {
    struct LocalizedSpecialty: Decodable {
        let id: Int
        let specialty_id: Int
        let state_id: Int
        let name: String
    }

}
