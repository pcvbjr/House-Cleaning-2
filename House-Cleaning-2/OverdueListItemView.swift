//
//  OverdueListItemView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 6/5/22.
//

import SwiftUI

struct OverdueListItemView: View {
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
						Text("OVERDUE")
							.font(.caption)
							.fontWeight(.bold)
							.padding(4)
							.background(Color("CustomRedColor"))
							.foregroundColor(Color("FontColor"))
							.border(Color("CustomRedColor"), width: 2)
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

/*struct OverdueListItemView_Previews: PreviewProvider {
	static var previews: some View {
		OverdueListItemView(checked: true, id: 2, duration: "12", datas: ReadData, name: <#String#>, date: <#String#>)
	}
}*/
