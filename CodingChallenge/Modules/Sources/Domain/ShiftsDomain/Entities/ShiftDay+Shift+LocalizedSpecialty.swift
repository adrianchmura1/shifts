//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import Foundation

public extension ShiftDay.Shift {
    struct LocalizedSpecialty {
        public let id: Int
        public let specialtyId: Int
        public let stateId: Int
        public let name: String

        public init(id: Int, specialtyId: Int, stateId: Int, name: String) {
            self.id = id
            self.specialtyId = specialtyId
            self.stateId = stateId
            self.name = name
        }
    }

}
