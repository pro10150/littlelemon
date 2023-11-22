//
//  MenuItem.swift
//  LittleLemonRestaurant
//
//  Created by noppakun.a on 22/11/2566 BE.
//

import Foundation

struct MenuItem: Decodable {
	let title: String
	let image: String
	let price: String
	let category: String
	let description: String
}
