//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @ObservedObject var viewModel: ShiftsViewModel

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.viewState {
                case .empty:
                    Text("EMPTY")
                case .loading:
                    Text("LOADING")
                case .error:
                    Text("ERROR")
                case .sections(let presentables):
                    List {
                        ForEach(presentables, id: \.title) { presentable in
                            Text(presentable.title)
                        }
                    }
                }
            }
            .navigationTitle("Shifts")
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

//struct ShiftsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShiftsView(viewModel: )
//    }
//}
