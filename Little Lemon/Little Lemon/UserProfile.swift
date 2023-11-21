//
//  UserProfile.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

struct UserProfile: View {
	@Environment(\.presentationMode) var presentation
	
	let firstName = UserDefaults.standard.string(forKey: kFirstName)
	let lastName = UserDefaults.standard.string(forKey: kLastName)
	let email = UserDefaults.standard.string(forKey: kEmail)
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Personal information")
				.font(.largeTitle)
				.bold()
			HStack {
				Spacer()
				Image("profile-image-placeholder")
					.resizable()
					.frame(width: 256, height: 256)
				Spacer()
			}
			Text(firstName ?? "")
			Text(lastName ?? "")
			Text(email ?? "")
			
			HStack {
				Spacer()
				Button("Logout") {
					UserDefaults.standard.set(false, forKey: kIsLoggedIn)
					self.presentation.wrappedValue.dismiss()
				}
				Spacer()
			}
			
			Spacer()
		}
		.padding()
	}
}

#Preview {
	UserProfile()
}
