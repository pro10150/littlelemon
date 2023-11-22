//
//  Onboarding.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

let kFirstName = "FirstNameKey"
let kLastName = "LastNameKey"
let kEmail = "EmailKey"
let kIsLoggedIn = "IsLoggedInKey"

struct Onboarding: View {
	@State private var firstName: String = ""
	@State private var lastName: String = ""
	@State private var email: String = ""
	@State private var isLoggedIn: Bool = false
	
	var body: some View {
		NavigationView {
			VStack {
				NavigationLink(destination: Home(), isActive: $isLoggedIn) {
					EmptyView()
				}
				TextField("First Name", text: $firstName)
					.textFieldStyle(.roundedBorder)
					.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
					.autocorrectionDisabled()
				
				TextField("Last Name", text: $lastName)
					.textFieldStyle(.roundedBorder)
					.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
					.autocorrectionDisabled()
				
				TextField("Email", text: $email)
					.textFieldStyle(.roundedBorder)
					.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
					.textInputAutocapitalization(.never)
				
				Button("Register") {
					if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && validateEmail(email: email) {
						UserDefaults.standard.set(firstName, forKey: kFirstName)
						UserDefaults.standard.set(lastName, forKey: kLastName)
						UserDefaults.standard.set(email, forKey: kEmail)
						UserDefaults.standard.set(true, forKey: kIsLoggedIn)
						isLoggedIn = true
					}
				}
				.buttonBorderShape(.capsule)
			}
			.onAppear() {
				if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
					isLoggedIn = true
				}
			}
		}
		
	}
}

func validateEmail(email: String) -> Bool {
	let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	
	let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegex)
	return emailPred.evaluate(with: email)
}

#Preview {
	Onboarding()
}
