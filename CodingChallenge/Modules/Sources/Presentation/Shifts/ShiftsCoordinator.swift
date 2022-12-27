//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import SwiftUI
import ShiftsDomain
import ShiftsData

public final class ShiftsCoordinator {
    public init() {}

    public var root: AnyView {
        let domainAssembly = DomainAssembly()
        let dataAssembly = DataAssembly()
        let getShiftsUseCase = domainAssembly.getShiftsUseCase(repository: dataAssembly.shiftsRepository)
        let viewModel = ShiftsViewModel(getShiftsUseCase: getShiftsUseCase)
        return AnyView(ShiftsView(viewModel: viewModel))
    }
}
