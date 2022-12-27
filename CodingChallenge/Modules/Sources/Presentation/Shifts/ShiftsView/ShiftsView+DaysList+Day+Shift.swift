//
//  File.swift
//  
//
//  Created by Adrian Chmura on 27/12/2022.
//

import SwiftUI

extension ShiftsView.DaysList.Day {
    struct Shift: View {
        private let presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable.ShiftDetailsPresentable

        init(presentable: ShiftsViewModel.ShiftsSectionPresentable.ShiftPresentable.ShiftDetailsPresentable) {
            self.presentable = presentable
        }

        var body: some View {
            VStack(alignment: .leading) {
                Text("Start: \(presentable.start)")
                Text("End: \(presentable.end)")
                Text("Specialty: \(presentable.specialty)")
                Text("Skill: \(presentable.skill)")
                Text("Timezone: \(presentable.timezone)")
                Text("Distance: \(presentable.distance)")
            }
        }
    }
}
