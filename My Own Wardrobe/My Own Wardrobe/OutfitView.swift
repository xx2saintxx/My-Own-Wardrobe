//
//  OutfitCreatorView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct OutfitView: View {
    @State private var selectedItems: [WardrobeItem] = []
    @State private var wardrobeItems = [
        WardrobeItem(name: "Red Dress", category: "Dress", color: "Red", brand: "BrandX", size: "M"),
        WardrobeItem(name: "Blue Jeans", category: "Jeans", color: "Blue", brand: "BrandY", size: "L"),
        WardrobeItem(name: "Green Shirt", category: "Shirt", color: "Green", brand: "BrandZ", size: "S")
    ]
    @State private var outfitName: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Outfit Name and Notes
                TextField("Outfit Name", text: $outfitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Notes", text: $notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Canvas Area
                VStack {
                    Text("Drag and Drop Items Here")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // Canvas area with dropped items
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(selectedItems) { item in
                                Text(item.name)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .frame(height: 100)
                    .background(Color.teal.opacity(0.1))
                    .cornerRadius(10)
                    .padding()
                }
                
                // List of Wardrobe Items
                List {
                    ForEach(wardrobeItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                addToOutfit(item: item)
                            }) {
                                Text("Add")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                
                // Save Outfit Button
                Button(action: saveOutfit) {
                    Text("Save Outfit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create Outfit")
        }
    }
    
    private func addToOutfit(item: WardrobeItem) {
        if !selectedItems.contains(where: { $0.id == item.id }) {
            selectedItems.append(item)
        }
    }
    
    private func saveOutfit() {
        // Save outfit logic here
        print("Outfit Saved: \(outfitName), with items: \(selectedItems.map { $0.name }) and notes: \(notes)")
    }
}


struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView()
    }
}

