//
//  FilterCheckboxView.swift
//  House-Cleaning-2
//
//  Created by Kaitlyn McCarthy on 7/10/22.
//

import SwiftUI

struct FilterCheckboxView: View {
    @Binding var checked: Bool
    var id: Int
    var status: String
//    var datas: ReadData
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            Text(status)
            Spacer()
        }
    }
}



struct FilterCheckboxView_Previews: PreviewProvider {
    struct FilterCheckboxViewHolder: View {
        @State var checked = false

        var body: some View {
            HStack {

                FilterCheckboxView(checked: $checked, id: 4, status: "Due: overdue")
            }
        }
    }

    static var previews: some View {
        Group {
            FilterCheckboxViewHolder()
            FilterCheckboxViewHolder()
        }
    }
}

