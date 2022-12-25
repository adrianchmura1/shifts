//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

struct ShiftsResponse: Decodable {
    var data: [ShiftsDataResponse]
}

struct ShiftsDataResponse: Decodable {
    var date: String
    var shifts: [ShiftResponse]
}

struct ShiftResponse: Decodable {
    var shift_id: Int
}
