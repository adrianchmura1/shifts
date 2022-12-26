//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation
import ShiftsDomain

protocol ShiftsRestService: AnyObject {
    func shifts() async throws  -> [ShiftDay]
}

final class DefaultShiftsRestService: ShiftsRestService {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    public func shifts() async throws -> [ShiftDay] {
        let queryItemAddress = URLQueryItem(name: "address", value: "Dallas%2C+TX")
        let queryItemType = URLQueryItem(name: "type", value: "4day")

        var components = URLComponents()
        components.scheme = "https"
        components.host = "staging-app.shiftkey.com"
        components.path = "/api/v2/available_shifts"
        components.queryItems = [queryItemAddress, queryItemType]

        guard let url = components.url else {
            preconditionFailure("Unable to create URL from components: \(components)")
        }

        let request = URLRequest(url: url)

        let shiftsResponse: ShiftsResponse = try await networkService.data(for: request)

        return shiftsResponse.data.map {
            guard let date = map($0.date) else {
                fatalError("Cannot parse date")
            }

            return ShiftDay(date: date, shifts: $0.shifts.map {
                ShiftDay.Shift(id: $0.shift_id,
                               start: $0.start_time,
                               end: $0.end_time,
                               timezone: $0.timezone,
                               kind: $0.shift_kind,
                               distance: $0.within_distance,
                               facilityType: ShiftDay.Shift.FacilityType(id: $0.facility_type.id, name: $0.facility_type.name, color: $0.facility_type.color),
                               skill: ShiftDay.Shift.Skill(id: $0.skill.id, name: $0.skill.name, color: $0.skill.color),
                               localizedSpecialty: ShiftDay.Shift.LocalizedSpecialty(id: $0.localized_specialty.id,
                                                                                     specialtyId: $0.localized_specialty.specialty_id,
                                                                                     stateId: $0.localized_specialty.state_id,
                                                                                     name: $0.localized_specialty.name))
            })
        }
    }

    private func map(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.date(from: dateString)
    }
}
