//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import SwiftUI

extension ShiftsView {
    struct DaysList: View {
        @EnvironmentObject var viewModel: ShiftsViewModel

        private let presentables: [ShiftsViewModel.ShiftsSectionPresentable]

        init(_ presentables: [ShiftsViewModel.ShiftsSectionPresentable]) {
            self.presentables = presentables
        }

        var body: some View {
            List {
                ForEach(presentables, id: \.title) { presentable in
                    NavigationLink(destination: {
                        LazyView {
                            AnyView(Day(presentables: presentable.shifts))
                        }
                    }, label: {
                        Text(presentable.title)
                    })
                }
            }
            .environmentObject(viewModel)
        }
    }
}
