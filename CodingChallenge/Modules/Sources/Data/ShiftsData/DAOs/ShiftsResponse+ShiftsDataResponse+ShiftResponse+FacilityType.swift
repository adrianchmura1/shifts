//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsResponse.ShiftsDataResponse.ShiftResponse {
    struct FacilityType: Decodable {
        let id: Int
        let name: String
        let color: String
    }
}
