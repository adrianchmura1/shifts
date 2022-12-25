//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct LazyView: View {
    @ViewBuilder let build: () -> AnyView

    var body: some View {
        build()
    }
}

struct ShiftsView: View {
    @ObservedObject var viewModel: ShiftsViewModel

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.viewState {
                case .empty:
                    Text("No shifts available")
                case .loading:
                    ProgressView()
                case .error:
                    Text("Error while fetching shifts")
                case .sections(let presentables):
                    DaysList(presentables)
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .navigationTitle("Shifts")
        }
        .environmentObject(viewModel)
    }
}

extension ShiftsView {
    struct DaysList: View {
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
        }
    }
}

extension ShiftsView.DaysList {
    struct Day: View {
        private let presentables: [ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable]

        init(presentables: [ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable]) {
            self.presentables = presentables
        }

        var body: some View {
            List {
                ForEach(presentables, id: \.self) { presentable in
                    NavigationLink(destination: {
                        LazyView {
                            AnyView(Shift(presentable: presentable.details))
                        }
                    }, label: {
                        shiftPreview(from: presentable)
                    })
                }
            }
        }

        @ViewBuilder
        func shiftPreview(from presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable) -> some View {
            Text("Start: \(presentable.start)")
            Text("End: \(presentable.end)")
            Text("Specialty: \(presentable.specialty)")
        }
    }
}

extension ShiftsView.DaysList.Day {
    struct Shift: View {
        private let presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable.ShiftDetailsPresentable

        init(presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable.ShiftDetailsPresentable) {
            self.presentable = presentable
        }

        var body: some View {
            Text("Start: \(presentable.start)")
            Text("End: \(presentable.end)")
            Text("Specialty: \(presentable.specialty)")
            Text("Skill: \(presentable.skill)")
            Text("Timezone: \(presentable.timezone)")
        }
    }
}
