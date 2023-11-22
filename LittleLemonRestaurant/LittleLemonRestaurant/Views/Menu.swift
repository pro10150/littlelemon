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
			Text("Little Lemon")
				.bold()
				.font(.title)
			
			Text("Bangkok")
				.bold()
				.font(.title3)
			
			Text("We are a family owned Mediterranean restaurant, focused on traditional  recipes served with a modern twist")
				.font(.subheadline)
			TextField("Search menu", text: $searchText)
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
						}

					}
				}
			}
		}
		.padding(16)
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
}

#Preview {
	Menu()
}
