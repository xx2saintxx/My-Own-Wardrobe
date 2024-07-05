//
//  SplashScreenView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image("WardrobeLogo")
        Text("Wardrobe").frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.teal) // Setting the background color to teal
            .edgesIgnoringSafeArea(.all) // Optional: makes the color cover the entire screen
        Image("LoaderHourglass")
    }
    }

#Preview {
    SplashScreenView()
}
