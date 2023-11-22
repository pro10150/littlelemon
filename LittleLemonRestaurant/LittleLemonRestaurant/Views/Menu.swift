//
//  Menu.swift
//  Little Lemon
//
//  Created by noppakun.a on 21/11/2566 BE.
//

import SwiftUI

struct Menu: View {
	@Environment(\.managedObjectContext) private var viewContext
	@State var searchText: String = ""
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Spacer()
				Image("little-lemon-logo", bundle: .main)
				
				Image("profile-image-placeholder")
					.resizable()
					.frame(maxWidth: .infinity, alignment: .trailing)
					.frame(width: 60, height: 60)
				
			}
			.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
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
				.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
				HStack {
					Image(systemName: "magnifyingglass")
						.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
					TextField("Search menu", text: $searchText)
				}
				.overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color.black))
				.background(.white)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
			}
			.background(Color(red: 0.29, green: 0.37, blue: 0.34))
			.frame(maxWidth: .infinity)
			
			Text("ORDER FOR DELIVERY!")
				.font(.custom("Karla", size: 20)
					.weight(.heavy))
				.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
			HStack {
				Button("Starters") {
					print("Starters")
				}
				.font(.custom("Karla", size: 18)
					.weight(.bold))
				.foregroundStyle(Color(red: 0.29, green: 0.37, blue: 0.34))
				.buttonStyle(.borderedProminent)
				.tint(Color(red: 0.93, green: 0.94, blue: 0.93))
				Button("Mains") {
					print("Mains")
				}
				.font(.custom("Karla", size: 18)
					.weight(.bold))
				.foregroundStyle(Color(red: 0.29, green: 0.37, blue: 0.34))
				.buttonStyle(.borderedProminent)
				.tint(Color(red: 0.93, green: 0.94, blue: 0.93))
				Button("Desserts") {
					print("Desserts")
				}
				.font(.custom("Karla", size: 18)
					.weight(.bold))
				.foregroundStyle(Color(red: 0.29, green: 0.37, blue: 0.34))
				.buttonStyle(.borderedProminent)
				.tint(Color(red: 0.93, green: 0.94, blue: 0.93))
				Button("Drinks") {
					print("Drinks")
				}
				.font(.custom("Karla", size: 18)
					.weight(.bold))
				.foregroundStyle(Color(red: 0.29, green: 0.37, blue: 0.34))
				.buttonStyle(.borderedProminent)
				.tint(Color(red: 0.93, green: 0.94, blue: 0.93))
			}
			.padding(8)
			.frame(alignment: .center)
			
			FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
				List {
					ForEach(dishes) { dish in
						NavigationLink {
							MenuDetail(dish: dish)
						} label: {
							HStack {
								Text("\(dish.title ?? "") $\(dish.price ?? "")")
								Spacer()
								AsyncImage(url: URL(string: dish.image ?? "")) {
									image in
									image.resizable()
								} placeholder: {
									ProgressView()
								}
								.frame(width: 100, height: 100)
							}
							.frame(maxWidth: .infinity)
						}
						
					}
				}
				.background(Color.white)
			}
			.background(Color.white)
		}
		.frame(maxWidth: .infinity)
		.onAppear() {
			getMenuData()
		}
		
	}
	
	func buildPredicate() -> NSPredicate {
		if searchText == "" {
			return NSPredicate(value: true)
		} else {
			return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
		}
	}
	
	func buildSortDescriptors() -> [NSSortDescriptor] {
		return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
	}
	
	func getMenuData() {
		PersistenceController.shared.clear()
		let urlAddress: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
		let url = URL(string: urlAddress)!
		let urlRequest = URLRequest(url: url)
		let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
			if let data = data {
				do {
					let menuList = try JSONDecoder().decode(MenuList.self, from: data)
					menuList.menu.forEach { menuItem in
						let dish = Dish(context: viewContext)
						dish.title = menuItem.title
						dish.image = menuItem.image
						dish.price = menuItem.price
						dish.category = menuItem.category
						dish.desc = menuItem.description
					}
					try viewContext.save()
				} catch {
					print(error)
				}
			}
		}
		task.resume()
	}
	
	let filterButton: [String] = ["Starters", "Mains", "Desserts", "Drinks"]
}

#Preview {
	Menu()
}
