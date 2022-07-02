//
//  DueOtherListItemView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 6/9/22.
//

import SwiftUI

struct DueOtherListItemView: View {
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
						Text("DUE LATER")
							.font(.caption)
							.fontWeight(.bold)
							.padding(4)
							.background(Color("CustomGrayColor"))
							.foregroundColor(Color("FontColor"))
							.border(Color("CustomGrayColor"), width: 2)
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


//struct DueOtherListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        DueOtherListItemView()
//    }
//}
