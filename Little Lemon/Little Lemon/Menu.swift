//
//  Menu.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

struct Menu: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Little Lemon")
				.bold()
				.font(.title)
			
			Text("Bangkok")
				.bold()
				.font(.title3)
			
			Text("We are a family owned Mediterranean restaurant, focused on traditional  recipes served with a modern twist")
				.font(.subheadline)
			
			List {
				
			}
		}
		.padding(16)
		
	}
}

#Preview {
	Menu()
}
