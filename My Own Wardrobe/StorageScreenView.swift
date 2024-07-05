//
//  StorageScreenView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct StorageScreenView: View {
    @State private var searchText = ""
    @State private var wardrobeItems = [
        WardrobeItem(name: "Red Dress", category: "Dress", color: "Red", brand: "BrandX", size: "M"),
        WardrobeItem(name: "Blue Jeans", category: "Jeans", color: "Blue", brand: "BrandY", size: "L"),
        WardrobeItem(name: "Green Shirt", category: "Shirt", color: "Green", brand: "BrandZ", size: "S")
    ]
    
    var filteredItems: [WardrobeItem] {
        if searchText.isEmpty {
            return wardrobeItems
        } else {
            return wardrobeItems.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search...", text: $searchText)
                        .padding(.leading, 8)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        // Add item action
                    }) {
                        Image(systemName: "plus")
                            .padding()
                    }
                }
                .padding()
                
                HStack {
                    Button(action: {
                        // Filter action
                    }) {
                        Text("Filter")
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        // Sort action
                    }) {
                        Text("Sort")
                            .padding()
                    }
                }
                .padding(.horizontal)
                
                List(filteredItems) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        Text(item.name)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Storage")
        }
    }
}

struct StorageScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StorageScreenView()
    }
}
