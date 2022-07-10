//
//  buildArray.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 6/12/22.
//

import Foundation

// build an array, based on status passed to function, to use for the respective expandable list in DetailView
func buildArray(status:Array<String>) -> Array<User> {
	let datas = ReadData()
	var itemArray = [User]()
	
	for user in datas.users {
		if status.contains(user.status) {
			itemArray += [user]
		}
	}
	print(itemArray)
	return itemArray
}

func buildStatusArray(filterChecks: Array<Bool>) -> Array<String> {
    var statuses = ["Due: overdue", "Due: today", "Due: within 7 days", "Due: other"]
    var statusArray: Array<String> = Array()
    var count = 0
    for checked in filterChecks {
        if checked {
            statusArray.append(statuses[count])
        }
        count += 1
    }
    return statusArray
}
