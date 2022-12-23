//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation
//
//{
//    "data": [
//        {
//            "date": "2022-12-23",
//            "shifts": [
//                {
//                    "shift_id": 4704501,
//                    "start_time": "2022-12-23T12:45:00+00:00",
//                    "end_time": "2022-12-24T01:15:00+00:00",

struct ShiftsResponse: Decodable {
    var data: [ShiftsDataResponse]
}

struct ShiftsDataResponse: Decodable {
    var date: Date
    var shifts: [ShiftResponse]
}

struct ShiftResponse: Decodable {
    var shift_id: String
}
