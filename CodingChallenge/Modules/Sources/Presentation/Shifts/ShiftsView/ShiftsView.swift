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
