//
//  File.swift
//
//
//  Created by Adrian Chmura on 23/12/2022.
//

public protocol ShiftsRepository: AnyObject {
    func fetchShifts() async throws -> [ShiftDay]
}
