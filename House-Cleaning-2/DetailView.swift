//
//  DetailView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct DetailView: View {
	var body: some View {
		//Text("DetailView page")
		var dueOtherArray = buildArray(status: "Due: other")
		var length = dueOtherArray.count
//        VStack {
//            ForEach(dueOtherArray) { user in
//                    Text(user.name)
//            }
//        }
		List(dueOtherArray){ user in
			Text(user.name)
			
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView()
	}
}
