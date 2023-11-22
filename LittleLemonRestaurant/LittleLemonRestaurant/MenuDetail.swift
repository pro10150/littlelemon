//
//  MenuDetail.swift
//  LittleLemonRestaurant
//
//  Created by noppakun.a on 22/11/2566 BE.
//

import SwiftUI

struct MenuDetail: View {
	let dish: Dish?
	var body: some View {
		VStack {
			Text(dish?.title ?? "")
				.font(.largeTitle)
				.bold()
			AsyncImage(url: URL(string: dish?.image ?? "")) {
				image in
				image.resizable()
			} placeholder: {
				ProgressView()
			}
			.frame(width: 300, height: 300)
			Text("$\(dish?.price ?? "")")
				.font(.title)
				.bold()
			Text("\(dish?.category ?? "")")
				.font(.subheadline)
			Text("\(dish?.desc ?? "")")
				.font(.caption)
			Spacer()
		}
	}
}

#Preview {
	MenuDetail(dish: nil)
}
