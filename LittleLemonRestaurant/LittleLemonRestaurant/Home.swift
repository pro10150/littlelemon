//
//  Home.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

struct Home: View {
	let persistence = PersistenceController.shared
	var body: some View {
		TabView {
			Menu()
				.environment(\.managedObjectContext, persistence.container.viewContext)
				.tabItem { Label("Menu", systemImage: "list.dash") }
			UserProfile()
				.tabItem { Label("Profile", systemImage: "square.and.pencil") }
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
	Home()
}
