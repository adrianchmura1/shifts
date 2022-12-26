//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import ShiftsDomain
import SwiftUI

final class ShiftsViewModel: ObservableObject {
    @Published var viewState: ViewState = .loading

    private let getShiftsUseCase: GetShiftsUseCase

    init(getShiftsUseCase: GetShiftsUseCase) {
        self.getShiftsUseCase = getShiftsUseCase
    }

    func onAppear() {
        guard viewState == .empty || viewState == .error || viewState == .loading else {
            return
        }

        Task {
            await setState(to: .loading)
            do {
                let shiftDays = try await getShiftsUseCase.execute()
                guard !shiftDays.isEmpty else {
                    await setState(to: .empty)
                    return
                }
                let presentables = shiftDays.map { ShiftsSectionPresentable(from: $0) }
                await setState(to: .sections(presentables))
            }
            catch {
                await handleError(error)
            }
        }
    }

    @MainActor
    private func setState(to state: ViewState) {
        self.viewState = state
    }

    private func handleError(_ error: Error) async {
        await setState(to: .error)
        #warning("TODO: Errors should be Domain only, implement mapping HTTP errors to Domain errors in Data layer")
    }

}
