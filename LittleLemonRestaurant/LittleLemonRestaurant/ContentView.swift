//
//  ContentView.swift
//  Little Lemon
//
//  Created by noppakun.a on 20/11/2566 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		Text("Select an item")
	}
}

#Preview {
	ContentView()
}
