//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

public protocol GetShiftsUseCase: AnyObject {
    func execute() async throws -> [ShiftDay]
}
