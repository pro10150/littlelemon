//
//  UserProfile.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

struct UserProfile: View {
	@Environment(\.presentationMode) var presentation
	
	@State private var firstNameText: String = ""
	@State private var lastNameText: String = ""
	@State private var emailText: String = ""
	@State private var phoneText: String = ""
	@State private var isOrderStatus: Bool = false
	@State private var isPasswordChange: Bool = false
	@State private var isSpecialOffer: Bool = false
	@State private var isNewsletter: Bool = false
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text("Personal information")
					.font(.custom("Karla", size: 24))
					.bold()
				Text("Avatar")
					.font(.custom("Karla", size: 16)
						.weight(.medium))
					.foregroundStyle(.gray)
				HStack (spacing: 16) {
					Image("profile-image-placeholder")
						.resizable()
						.frame(width: 60, height: 60)
					Button("Change") {
						print("This will change avatar")
					}
					.buttonStyle(.borderedProminent)
					.font(.custom("Karla", size: 16)
						.weight(.medium))
					.tint(Color(red: 0.29, green: 0.37, blue: 0.34))
					Button {
						print("This will remove avatar")
					} label: {
						Text("Remove")
							.padding(6)
					}
					.font(.custom("Karla", size: 16)
						.weight(.medium))
					.foregroundStyle(.gray)
					.buttonStyle(.plain)
					.border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
				} .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
				VStack (alignment: .leading, spacing: 8) {
					Text("First Name")
						.font(.custom("Karla", size: 16))
					TextField("Enter First Name", text: $firstNameText)
						.textFieldStyle(.roundedBorder)
					Text("Last Name")
						.font(.custom("Karla", size: 16))
					TextField("Enter Last Name", text: $lastNameText)
						.textFieldStyle(.roundedBorder)
					Text("Email")
						.font(.custom("Karla", size: 16))
					TextField("Enter Email", text: $emailText)
						.textFieldStyle(.roundedBorder)
					Text("Phone number")
						.font(.custom("Karla", size: 16))
					TextField("Enter Phonenumber", text: $phoneText)
						.textFieldStyle(.roundedBorder)
					Text("Email notifications")
						.font(.custom("Karla", size: 16)
							.weight(.bold
								   ))
						.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16))
					Toggle(isOn: $isOrderStatus) {
						Text("Order statuses")
							.font(.custom("Karla", size: 16))
					}
					Toggle(isOn: $isPasswordChange) {
						Text("Password changes")
							.font(.custom("Karla", size: 16))
					}
					Toggle(isOn: $isSpecialOffer) {
						Text("Special offers")
							.font(.custom("Karla", size: 16))
					}
					Toggle(isOn: $isNewsletter) {
						Text("Newsletter")
							.font(.custom("Karla", size: 16))
					}
				}
				
				HStack {
					Button {
						UserDefaults.standard.set(false, forKey: kIsLoggedIn)
						self.presentation.wrappedValue.dismiss()
					} label: {
						Text("Logout")
							.frame(maxWidth: .infinity)
					}
					.buttonStyle(.borderedProminent)
					.tint(Color(red: 0.96, green: 0.81, blue: 0.08))
					.foregroundColor(.black)
				}
				.frame(maxWidth: .infinity)
				
				HStack {
					Button {
						firstNameText = UserDefaults.standard.string(forKey: kFirstName) ?? firstNameText
						lastNameText = UserDefaults.standard.string(forKey: kLastName) ?? lastNameText
						emailText = UserDefaults.standard.string(forKey: kEmail) ?? emailText
						phoneText = UserDefaults.standard.string(forKey: kPhone) ?? phoneText
						
						isOrderStatus = UserDefaults.standard.bool(forKey: kOrderStatus)
						isPasswordChange = UserDefaults.standard.bool(forKey: kPasswordChange)
						isSpecialOffer = UserDefaults.standard.bool(forKey: kSpecialOffer)
						isNewsletter = UserDefaults.standard.bool(forKey: kNewsletter)
					} label: {
						Text("Discard changes")
					}
					.buttonStyle(.borderedProminent)
					.font(.custom("Karla", size: 16)
						.weight(.medium))
					.foregroundStyle(.gray)
					.tint(.white)
					.overlay(RoundedRectangle(cornerRadius: 4)
						.stroke(Color(red: 0.29, green: 0.37, blue: 0.34)))
					
					Button {
						UserDefaults.standard.set(firstNameText, forKey: kFirstName)
						UserDefaults.standard.set(lastNameText, forKey: kLastName)
						UserDefaults.standard.set(emailText, forKey: kEmail)
						UserDefaults.standard.set(phoneText, forKey: kPhone)
						UserDefaults.standard.set(isOrderStatus, forKey: kOrderStatus)
						UserDefaults.standard.set(isPasswordChange, forKey: kPasswordChange)
						UserDefaults.standard.set(isSpecialOffer, forKey: kSpecialOffer)
						UserDefaults.standard.set(isNewsletter, forKey: kNewsletter)
					} label: {
						Text("Save changes")
					}
					.buttonStyle(.borderedProminent)
					.font(.custom("Karla", size: 16)
						.weight(.medium))
					.tint(Color(red: 0.29, green: 0.37, blue: 0.34))
				}
				.frame(maxWidth: .infinity, alignment: .center)
				
				Spacer()
			}
			.padding()
			.onAppear() {
				setPersonalInformation()
			}
		}
	}
	
	func setPersonalInformation() {
		
		let firstName = UserDefaults.standard.string(forKey: kFirstName)
		let lastName = UserDefaults.standard.string(forKey: kLastName)
		let email = UserDefaults.standard.string(forKey: kEmail)
		let phone = UserDefaults.standard.string(forKey: kPhone)
		let orderStatus = UserDefaults.standard.bool(forKey: kOrderStatus)
		let passwordChange = UserDefaults.standard.bool(forKey: kPasswordChange)
		let specialOffer = UserDefaults.standard.bool(forKey: kSpecialOffer)
		let newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
		
		firstNameText = firstName ?? ""
		lastNameText = lastName ?? ""
		emailText = email ?? ""
		phoneText = phone ?? ""
		isOrderStatus = orderStatus
		isPasswordChange = passwordChange
		isSpecialOffer = specialOffer
		isNewsletter = newsletter
		
	}
}

#Preview {
	UserProfile()
}
