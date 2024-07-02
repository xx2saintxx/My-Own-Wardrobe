//
//  ImageLiftView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 7/2/24.
//

import SwiftUI

struct ImageLiftView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ImageLift(imageName: "dog")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    ImageLiftView()
}
