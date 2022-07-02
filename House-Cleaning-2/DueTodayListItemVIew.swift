//
//  DueTodayListItemView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 6/9/22.
//

import SwiftUI

struct DueTodayListItemView: View {
	@Binding var checked: Bool
	var id: Int
	var duration: String
	var datas: ReadData
	var name: String
	var date: String
	
	var body: some View {
		ZStack{
			Color(.white).padding([.leading, .trailing], -20)
			HStack{
				CheckboxView(checked: $checked, id: id, duration: duration, datas: datas)
			//}

				VStack(alignment: .leading) {
					HStack {
						Text(name)
							.font(.title3)
							.foregroundColor(Color.black)
							.fontWeight(.bold)
						Spacer()
						Text("DUE TODAY")
							.font(.caption)
							.fontWeight(.bold)
							.padding(4)
							.background(Color("CustomGreenColor"))
							.foregroundColor(Color("FontColor"))
							.border(Color("CustomGreenColor"), width: 2)
							
					}
					Spacer()
					HStack{
						Text(duration + " days")
							.font(.body)
							.foregroundColor(Color.black)
						Spacer()
						Text(date)
							.font(.body)
					}
				}
			}
		}
	}
}

/*struct DueTodayListItemView_Previews: PreviewProvider {
	static var previews: some View {
	 DueTodayListItemView(checked: true, id: 2, duration: "12", datas: ReadData, name: <#String#>, date: <#String#>)
	}
}*/
