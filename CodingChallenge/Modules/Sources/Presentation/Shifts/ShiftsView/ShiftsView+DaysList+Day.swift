//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import SwiftUI

extension ShiftsView.DaysList {
    struct Day: View {
        @EnvironmentObject var viewModel: ShiftsViewModel

        private let presentables: [ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable]

        init(presentables: [ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable]) {
            self.presentables = presentables
        }

        var body: some View {
            List {
                ForEach(presentables, id: \.self) { presentable in
                    shiftPreview(from: presentable)
                        .onTapGesture {
                            viewModel.presentableTapped(presentable)
                        }
                }
            }
            .sheet(isPresented: $viewModel.isModalVisible,
                   onDismiss: {
                viewModel.modalDismissed()
            }, content: {
                LazyView {
                    AnyView(Shift(presentable: viewModel.presentableModal!.details))
                }
            }
            )
        }

        @ViewBuilder
        func shiftPreview(from presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable) -> some View {
            VStack(alignment: .leading) {
                Text("Start: \(presentable.start)")
                Text("End: \(presentable.end)")
                Text("Specialty: \(presentable.specialty)")
            }
            .padding()
        }
    }
}
