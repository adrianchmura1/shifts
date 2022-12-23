//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

public final class DomainAssembly {
    public func getShiftsUseCase(repository: ShiftsRepository) -> GetShiftsUseCase {
        DefaultGetShiftsUseCase(repository: repository)
    }
}
