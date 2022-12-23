//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import ShiftsDomain
import SwiftUI

final class ShiftsViewModel: ObservableObject {
    enum ViewState: Equatable {
        case loading
        case empty
        case sections([ShiftsSectionPresentable])
    }

    private let getShiftsUseCase: GetShiftsUseCase

    init(getShiftsUseCase: GetShiftsUseCase) {
        self.getShiftsUseCase = getShiftsUseCase
    }

    func onAppear() {

    }


}

struct ShiftsSectionPresentable: Equatable {

}
