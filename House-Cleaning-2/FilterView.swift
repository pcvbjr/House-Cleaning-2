//
//  FilterView.swift
//  House-Cleaning-2
//
//  Created by Kaitlyn McCarthy on 7/10/22.
//

import SwiftUI

struct FilterView: View {
  //  @ObservedObject var datas: ReadData
    @Binding var checked: [Bool]
	
	func selectAll() {
		var count = 0
		for _ in checked{
			checked[count] = true
			count += 1
		}
	}
	
	func clear() {
		var count = 0
		for _ in checked{
			checked[count] = false
			count += 1
		}
	}

    var body: some View {
        VStack {
			HStack{
				Button(action: {
						print("Select All")
						selectAll()
					}, label: {
						Text("Select All")
							.font(.title3)
							.foregroundColor(Color.blue)
							.padding(8)
							.overlay(
								RoundedRectangle(cornerRadius: 12)
									.stroke(Color.blue, lineWidth: 2))
					})
				
				Spacer()
				Button(action: {
						print("Clear")
						clear()
					}, label: {
						Text("Clear")
							.font(.title3)
							.foregroundColor(Color.red)
							.padding(8)
							.overlay(
								RoundedRectangle(cornerRadius: 12)
									.stroke(Color.red, lineWidth: 2))
					})
			}
            FilterCheckboxView(checked: $checked[0], id: 0, status: "Overdue")
            FilterCheckboxView(checked: $checked[1], id: 1, status: "Due today")
            FilterCheckboxView(checked: $checked[2], id: 2, status: "Due this week")
            FilterCheckboxView(checked: $checked[3], id: 3, status: "Due later")
        }
        .padding(.horizontal)
    }
}


struct FilterView_Previews: PreviewProvider {
    struct FilterViewHolder: View {
        @State var checked = [true, true, true, true]
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
