//
//  SharingScreenView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct SharingScreenView: View {
    @State private var wardrobeItems = [
        WardrobeItem(name: "Red Dress", category: "Dress", color: "Red", brand: "BrandX", size: "M"),
        WardrobeItem(name: "Blue Jeans", category: "Jeans", color: "Blue", brand: "BrandY", size: "L"),
        WardrobeItem(name: "Green Shirt", category: "Shirt", color: "Green", brand: "BrandZ", size: "S")
    ]
    
    @State private var outfits = [
        Outfit(name: "Casual Outfit", items: ["Blue Jeans", "Green Shirt"]),
        Outfit(name: "Party Outfit", items: ["Red Dress", "Black Heels"])
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Wardrobe Items")) {
                    ForEach(wardrobeItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                shareItem(item: item)
                            }) {
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                    }
                }
                
                Section(header: Text("Outfits")) {
                    ForEach(outfits) { outfit in
                        HStack {
                            Text(outfit.name)
                            Spacer()
                            Button(action: {
                                shareOutfit(outfit: outfit)
                            }) {
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Share Items")
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    func shareItem(item: WardrobeItem) {
        let shareText = """
        Check out this item from my wardrobe!
        Name: \(item.name)
        Category: \(item.category)
        Color: \(item.color)
        Brand: \(item.brand)
        Size: \(item.size)
        """
        
        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        presentActivityViewController(activityVC)
    }
    
    func shareOutfit(outfit: Outfit) {
        let shareText = """
        Check out this outfit from my wardrobe!
        Outfit: \(outfit.name)
        Items: \(outfit.items.joined(separator: ", "))
        """
        
        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        presentActivityViewController(activityVC)
    }
    
    private func presentActivityViewController(_ activityVC: UIActivityViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        if let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        SharingScreenView()
    }
}

