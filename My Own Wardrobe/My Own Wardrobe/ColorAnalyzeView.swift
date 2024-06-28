import SwiftUI

struct ColorAnalyzeView: View {
    @State private var selectedColor: Color? = nil
    @State private var wardrobeItems = [
        WardrobeItem(name: "Red Dress", category: "Dress", color: "Red", brand: "BrandX", size: "M"),
        WardrobeItem(name: "Blue Jeans", category: "Jeans", color: "Blue", brand: "BrandY", size: "L"),
        WardrobeItem(name: "Green Shirt", category: "Shirt", color: "Green", brand: "BrandZ", size: "S")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Color Palette Selection
                ColorPaletteView(selectedColor: $selectedColor)
                
                // Filtered List of Wardrobe Items
                List(filteredItems) { item in
                    Text(item.name)
                }
                
                // Suggestions for Color-Coordinated Outfits
                if let selectedColor = selectedColor {
                    Text("Suggested Outfits for \(selectedColor.description)")
                        .font(.headline)
                        .padding()
                    List(suggestedOutfits(for: selectedColor)) { outfit in
                        Text(outfit.name)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Color Analyze")
        }
    }
    
    private var filteredItems: [WardrobeItem] {
        if let selectedColor = selectedColor {
            return wardrobeItems.filter { $0.color.lowercased() == selectedColor.description.lowercased() }
        } else {
            return wardrobeItems
        }
    }
    
    private func suggestedOutfits(for color: Color) -> [Outfit] {
        // Implement your logic for suggesting color-coordinated outfits
        // For simplicity, we return all outfits in this example
        return [
            Outfit(name: "Casual Outfit", items: ["Blue Jeans", "Green Shirt"]),
            Outfit(name: "Party Outfit", items: ["Red Dress", "Black Heels"])
        ]
    }
}

struct ColorPaletteView: View {
    @Binding var selectedColor: Color?
    private let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink, .gray, .black, .white]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(colors, id: \.self) { color in
                    ColorCircle(color: color, isSelected: color == selectedColor)
                        .onTapGesture {
                            selectedColor = color
                        }
                }
            }
            .padding()
        }
    }
}

struct ColorCircle: View {
    var color: Color
    var isSelected: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
            if isSelected {
                Circle()
                    .stroke(Color.black, lineWidth: 4)
                    .frame(width: 60, height: 60)
            }
        }
    }
}



struct ColorAnalyzeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorAnalyzeView()
    }
}
