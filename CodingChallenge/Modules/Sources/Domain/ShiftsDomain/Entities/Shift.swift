//
//  File.swift
//
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

public extension ShiftDay {
    struct Shift {
        public let id: Int
        public let start: Date
        public let end: Date
        public let timezone: String
        public let kind: String
        public let distance: Int
        public let facilityType: FacilityType
        public let skill: Skill
        public let localizedSpecialty: LocalizedSpecialty

        public init(id: Int, start: Date, end: Date, timezone: String, kind: String, distance: Int, facilityType: FacilityType, skill: Skill, localizedSpecialty: LocalizedSpecialty) {
            self.id = id
            self.start = start
            self.end = end
            self.timezone = timezone
            self.kind = kind
            self.distance = distance
            self.facilityType = facilityType
            self.skill = skill
            self.localizedSpecialty = localizedSpecialty
        }
    }
}

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

public extension ShiftDay.Shift {
    struct Skill {
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
