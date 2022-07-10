//
//  FilterView.swift
//  House-Cleaning-2
//
//  Created by Kaitlyn McCarthy on 7/10/22.
//

import SwiftUI

struct FilterView: View {
  //  @ObservedObject var datas: ReadData

    @Binding var checked: Bool

    var body: some View {
        VStack {
            FilterCheckboxView(checked: $checked, id: 1, status: "Overdue")
            FilterCheckboxView(checked: $checked, id: 2, status: "Due today")
            FilterCheckboxView(checked: $checked, id: 3, status: "Due this week")
            FilterCheckboxView(checked: $checked, id: 4, status: "Due later")
        }
        .padding(.horizontal)
    }
}


struct FilterView_Previews: PreviewProvider {
    struct FilterViewHolder: View {
        @State var checked = false
     //   var datas = ReadData()


        var body: some View {
            HStack {

                FilterView(checked: $checked)
            }
        }
    }

    static var previews: some View {
        Group {
            FilterViewHolder()
        }
    }
}
