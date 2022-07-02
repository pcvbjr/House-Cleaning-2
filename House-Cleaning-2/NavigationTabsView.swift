//
//  NavigationTabs.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct NavigationTabsView: View {
	@StateObject var datas = ReadData()

	var body: some View {

			TabView() {
				HomeView(datas: datas)
					.tabItem {
						Image(systemName: "book.fill")
					}
					.tag(1)
				DetailView(datas: datas)
					.tabItem {
						Image(systemName: "books.vertical.fill")
					}
					.tag(2)
			}
	}
}

struct NavigationTabs_Previews: PreviewProvider {
	static var previews: some View {
		NavigationTabsView()
	}
}
