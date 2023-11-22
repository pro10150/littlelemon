//
//  LittleLemonRestaurantApp.swift
//  LittleLemonRestaurant
//
//  Created by noppakun.a on 22/11/2566 BE.
//

import SwiftUI

@main
struct LittleLemonRestaurantApp: App {
	let persistenceController = PersistenceController.shared
	
	var body: some Scene {
		WindowGroup {
			Onboarding()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
		}
	}
}
