//
//  HomeScreenView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Title
                Text("My Wardrobe")
                    .font(.largeTitle)
                    .padding(50)
                
                // Navigation Buttons
                HStack {
                    NavigationLink(destination: StorageScreenView()) {
                        HomeButton(title: "Storage", icon: "folder.fill")
                    }
                    NavigationLink(destination: SharingScreenView()) {
                        HomeButton(title: "Sharing", icon: "square.and.arrow.up.fill")
                    }
                }
                HStack {
                    NavigationLink(destination: OutfitView()) {
                        HomeButton(title: "Outfit Creator", icon: "square.grid.2x2.fill")
                    }
                    NavigationLink(destination: ColorAnalyzeView()) {
                        HomeButton(title: "Color Analyzation", icon: "paintpalette.fill")
                    }
                }
                
                // Recent Outfits Section
                Text("Recent Outfits")
                    .font(.title2)
                    .padding(.top, 50)
                
                List {
                    Text("Outfit 1").padding(5)
                    Text("Outfit 2").padding(5)
                    Text("Outfit 3").padding(5)
                }
                
                Spacer()
            }
            .background(Color.teal)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomeButton: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text(title)
                .font(.headline)
        }
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Placeholder Views for Navigation
struct StorageView: View {
    var body: some View {
        Text("Storage View")
    }
}

struct SharingView: View {
    var body: some View {
        Text("Sharing View")
    }
}

struct OutfitCreatorView: View {
    var body: some View {
        Text("Outfit Creator View")
    }
}

struct ColorAnalyzationView: View {
    var body: some View {
        Text("Color Analyzation View")
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

