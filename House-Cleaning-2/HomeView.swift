//
//  HomeView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var datas: ReadData
	
	
	var body: some View {
		
		
		
		//		DynoListView()
		
		//Text("DetailView page")
		var homeArray = buildArray(status: ["Due: overdue", "Due: today"])
		var length = homeArray.count
		//        VStack {
		//            ForEach(dueOtherArray) { user in
		//                    Text(user.name)
		//            }
		//        }
		
		VStack {
			
			Text("Welcome home, fancy pants!")
				.font(.title2)
				.bold()
				.padding(.all, 20.0)
				.multilineTextAlignment(.leading)
			
			Spacer()
			switch length > 0 {
			case true:
				List(homeArray){ user in
					
					let userStatus = user.status
					
					switch userStatus {
					
					// if the case "Due: overdue" is met, use the corresponding View
					case "Due: overdue":
						SimpleOverdueView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					// if the case "Due: overdue" is not met, use the case "Due: today" and its corresponding view
					case "Due: today":
						SimpleDueTodayView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					// if neither of the cases above are met, show the default
					
					default:
						Text("Error in list")
					}
					
				
				}
			default:
			NoItemsView()
			}
			Spacer()
		}

	}
	
	
	
	
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		var datas = ReadData()
		HomeView(datas: datas)
	}
}
