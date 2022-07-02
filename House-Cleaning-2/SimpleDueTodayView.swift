//
//  SimpleDueTodayView.swift
//  House-Cleaning-2
//
//  Created by Chris Van Buren on 7/2/22.
//

import SwiftUI

struct SimpleDueTodayView: View {
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
			}
		}
    }
}

//struct SimpleDueTodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleDueTodayView()
//    }
//}
