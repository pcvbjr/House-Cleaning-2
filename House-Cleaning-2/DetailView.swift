//
//  DetailView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI
import Foundation

struct DetailView: View {
	@ObservedObject var datas: ReadData
	@State private var showFilter = false
	@State var filterChecks = [true, true, true, true]


	var body: some View {
		
		VStack{
			Button(action: {
				showFilter.toggle()
			}) {
			  Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
			}

			
			if showFilter {
				FilterView(checked: $filterChecks)
				}
			}
			

		
			List {
				ForEach(datas.users) {
					let user = $0
					let today = Date()
					let todayDateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: today)
					let today_str = dateToString(date: todayDateComponents)
					
					// create a status variable to determine what View to show
					let userStatus = user.status
					
					switch userStatus {
					
					// if the case "Due: overdue" is met, use the corresponding View
					case "Due: overdue":
						OverdueListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					// if the case "Due: overdue" is not met, use the case "Due: today" and its corresponding view
					case "Due: today":
						DueTodayListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					// if the cases overdue and today are not met, check if the case for due within 7 days is met and, if so, use its corresponding view
					case "Due: within 7 days":
						DueNext7DaysListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					// if none of the cases are met, the default is the the view associated with "Due: other"
					default:
						DueOtherListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					}

				}

			}
			Spacer()
			
		}
	
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		var datas = ReadData()
		DetailView(datas: datas)
	}
}
