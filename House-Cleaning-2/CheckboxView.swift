//
//  CheckboxView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 3/12/22.
//
import SwiftUI

struct CheckboxView: View {
	@Binding var checked: Bool
	var id: Int
	var duration: String
	var datas: ReadData

	var body: some View {
		Image(systemName: checked ? "checkmark.square.fill" : "square")
			.foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
			.onTapGesture {
				self.checked.toggle()
				var newDate = dateAdder(duration: duration)
				var count = 0
				for var user in datas.users {
					if user.id == id{
						user.date = newDate
						print(user.date)
						print(user)
						// update Status and updated user.status changed
						let newStatus = updateStatusOnceChecked(newDate: newDate)
						user.status = newStatus
						datas.users[count] = user
						print(datas.users)
						// user is updated to new date. write this to json file
						print("checked, initiate write")
						datas.writeData()
						break
					}
					else{
						count += 1
					}
				}
				// this unchecks box after 5s.
				// TODO: replace with pull down refresh that resets all boxes to unchecked
				let seconds = 5.0
				DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
					self.checked.toggle()
				}
			}
			.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
	}
}

struct CheckBoxView_Previews: PreviewProvider {
	struct CheckBoxViewHolder: View {
		@State var checked = false

		var body: some View {
			HStack {

				CheckboxView(checked: $checked, id: 4, duration: "14", datas: ReadData())
			Text("Element that requires checkmark!")
			}
		}
	}

	static var previews: some View {
		Group {
			CheckBoxViewHolder()
			CheckBoxViewHolder()
		}
	}
}
