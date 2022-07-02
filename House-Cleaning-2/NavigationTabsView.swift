//
//  NavigationTabs.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct NavigationTabsView: View {
	@ObservedObject var datas = ReadData()

	var body: some View {

			TabView(selection: .constant(1)) {
				HomeView()
					.tabItem {
						Image(systemName: "book.fill")
					}
					.tag(1)
				DetailView()
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
