//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

extension ShiftsViewModel {
    enum ViewState: Equatable {
        case loading
        case empty
        case error
        case sections([ShiftsSectionPresentable])
    }
}
