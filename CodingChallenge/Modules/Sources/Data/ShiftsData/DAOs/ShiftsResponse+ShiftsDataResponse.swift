//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

extension ShiftsResponse {
    struct ShiftsDataResponse: Decodable {
        let date: String
        let shifts: [ShiftResponse]
    }
}
