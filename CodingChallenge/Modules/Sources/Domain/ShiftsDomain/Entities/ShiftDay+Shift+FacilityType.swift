//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

public extension ShiftDay.Shift {
    struct FacilityType {
        public let id: Int
        public let name: String
        public let color: String

        public init(id: Int, name: String, color: String) {
            self.id = id
            self.name = name
            self.color = color
        }
    }
}
