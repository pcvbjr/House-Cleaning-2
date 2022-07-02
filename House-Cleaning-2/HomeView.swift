//
//  HomeView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct HomeView: View {
	//@State var checked: [Bool] = [false, false, true, false, true]
	

	
	// TODO: dynamically make $checked list for each element in json file, do this outside of views
	

	

	var body: some View {
		
		DynoListView()
		
		
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
