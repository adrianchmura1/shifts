//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

public struct ShiftDay {
    public let date: String
    public let shifts: [Shift]

    public init(date: String, shifts: [Shift]) {
        self.date = date
        self.shifts = shifts
    }
}
