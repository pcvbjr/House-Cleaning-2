//
//  buildArray.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 6/12/22.
//

import Foundation

// build an array, based on status passed to function, to use for the respective expandable list in DetailView
func buildArray(status:String) -> Array<User> {
	let datas = ReadData()
	var itemArray = [User]()
	
	for user in datas.users {
		if user.status == status {
			itemArray += [user]
		}
	}
	print(itemArray)
	return itemArray
}
