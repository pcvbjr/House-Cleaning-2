//
//  NoItemsView.swift
//  House-Cleaning-2
//
//  Created by Chris Van Buren on 7/2/22.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        Text("Lucky you! No items were found for your current search. Try a different filter or check back another day for your next set of cleaning tasks.")
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
