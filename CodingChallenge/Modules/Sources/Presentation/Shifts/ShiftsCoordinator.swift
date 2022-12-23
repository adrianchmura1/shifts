//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import SwiftUI

public protocol DependencyContainer: AnyObject {
    var shiftsView: AnyView { get }
}

public final class DefaultDependencyContainer: DependencyContainer {
    public init() {}

    public var shiftsView: AnyView {
        let viewModel = ShiftsViewModel()
        let shiftsView = ShiftsView(viewModel: viewModel)
        return AnyView(shiftsView)
    }
}

public final class ShiftsCoordinator {
    private let container: DependencyContainer

    public init(container: DependencyContainer) {
        self.container = container
    }

    public var root: AnyView {
        container.shiftsView
    }
}
