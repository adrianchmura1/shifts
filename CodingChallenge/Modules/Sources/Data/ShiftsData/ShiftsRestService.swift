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
        let queryItemAddress = URLQueryItem(name: "address", value: "Dallas, TX")
        let queryItemType = URLQueryItem(name: "type", value: "4day")

        var components = URLComponents()
        components.scheme = "https"
        components.host = "staging-app.shiftkey.com"
        components.path = "api/v2/available_shifts"
        components.queryItems = [queryItemAddress, queryItemType]

        guard let url = components.url else {
            preconditionFailure("Unable to create URL from components: \(components)")
        }

        let request = URLRequest(url: url)

        let shiftsResponse: ShiftsResponse = try await networkService.data(for: request)

        return shiftsResponse.data.map {
            ShiftDay(date: $0.date, shifts: $0.shifts.map { Shift(name: $0.shift_id) } )
        }
    }
}
