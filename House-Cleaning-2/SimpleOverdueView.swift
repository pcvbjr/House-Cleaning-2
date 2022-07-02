//
//  SimpleOverdueView.swift
//  House-Cleaning-2
//
//  Created by Chris Van Buren on 7/2/22.
//

import SwiftUI

struct SimpleOverdueView: View {
    
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
						Text("OVERDUE")
							.font(.caption)
							.fontWeight(.bold)
							.padding(4)
							.background(Color("CustomRedColor"))
							.foregroundColor(Color("FontColor"))
							.border(Color("CustomRedColor"), width: 2)
					}
			}
		}
	}
		
		
		
    }


//struct SimpleOverdueView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleOverdueView()
//    }
//}
