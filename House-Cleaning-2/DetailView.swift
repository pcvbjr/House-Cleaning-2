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
			
            // TO DO: build an array of statuses based on filterChecks array. Anything indicated as true should have a corresponding status in the array
            var statusesToShow = buildStatusArray(filterChecks: filterChecks)
            var tasksToShow = buildArray(status: statusesToShow)
            
            // TO DO: use array to loop through and create List - this array should replace datas.users in the below ForEach loop
		
			List {
				ForEach(tasksToShow) {
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
					// check if the case is Due: other
                    case "Due: other":
                        DueOtherListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
                    // if none of the cases are met, ie. the status array is empty, the user has filtered in a way that shows no tasks. Give them direction to try a new search
                    default:
						Text("Your current filter didn't return any results! Try resetting your filters or a different search to view more cleaning tasks.")
					}

				}

			}
			Spacer()
			
		} //VStack
	
	} //var body
} //DetailView

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		var datas = ReadData()
		DetailView(datas: datas)
	}
}
