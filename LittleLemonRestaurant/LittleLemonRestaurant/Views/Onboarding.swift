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
let kPhone = "PhoneKey"
let kOrderStatus = "OrderStatusKey"
let kPasswordChange = "PasswordChangeKey"
let kSpecialOffer = "SpecialOfferKey"
let kNewsletter = "NewsletterKey"

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
				Image("little-lemon-logo", bundle: .main)
				VStack(alignment: .leading, spacing: 0) {
				 Text("Little Lemon")
					 .font(
						 .custom("Markazi Text", size: 64))
					 .fontWeight(.medium)
					 .foregroundStyle(Color(red: 0.96, green: 0.81, blue: 0.08))
					 .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
				 Text("Bangkok")
					 .font(Font.custom("Markazi Text", size: 40))
					 .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
					 .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
				 
				 HStack (alignment: .top) {
					 VStack (alignment: .leading) {
						 
						 Text("We are a family owned Mediterranean restaurant, focused on traditional  recipes served with a modern twist")
							 .font(.custom("Karla", size: 18)
								 .weight(.medium))
							 .foregroundStyle(.white)
					 }
					 
					 Image("hero-image", bundle: .main)
						 .resizable()
						 .frame(width: 130, height: 150)
						 .clipShape(RoundedRectangle(cornerRadius: 8))
				 }
				 .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
			 }
			 .background(Color(red: 0.29, green: 0.37, blue: 0.34))
			 .frame(maxWidth: .infinity)
				VStack (alignment: .leading, spacing: 8) {
					Text("Name *")
						.foregroundStyle(.gray)
					TextField("First Name", text: $firstName)
						.textFieldStyle(.roundedBorder)
						.autocorrectionDisabled()
					Text("Last Name *")
						.foregroundStyle(.gray)
					TextField("Last Name", text: $lastName)
						.textFieldStyle(.roundedBorder)
						.autocorrectionDisabled()
					Text("Email *")
						.foregroundStyle(.gray)
					TextField("Email", text: $email)
					 .textFieldStyle(.roundedBorder)
					 .textInputAutocapitalization(.never)
				}
				.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
				
				Button("Register") {
					if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && validateEmail(email: email) {
						UserDefaults.standard.set(firstName, forKey: kFirstName)
						UserDefaults.standard.set(lastName, forKey: kLastName)
						UserDefaults.standard.set(email, forKey: kEmail)
						UserDefaults.standard.set(true, forKey: kIsLoggedIn)
						isLoggedIn = true
					}
				}
				.font(.custom("Karla", size: 18)
					.weight(.bold))
				.foregroundStyle(.black)
				.buttonStyle(.borderedProminent)
				.tint(Color(red: 0.98, green: 0.81, blue: 0.08))
				Spacer()
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
