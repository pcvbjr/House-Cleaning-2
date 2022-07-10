//
//  ContentView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/8/22.
//

import SwiftUI

func getDocumentsDirectory() -> URL {
	// find all possible documents directories for this user
	let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

	// just send back the first one, which ought to be the only one
	return paths[0]
}

struct ContentView: View {
	var body: some View {
		NavigationView{
			NavigationTabsView()
				.navigationTitle("CleanWiz")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
							  Button(action: {
								print("Settings")
							  }) {
								Label("Settings", systemImage: "gearshape.fill")
							  }
							}
				}
		}
		
	}
		
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environment(\.locale, Locale(identifier: "us"))
	}
}
