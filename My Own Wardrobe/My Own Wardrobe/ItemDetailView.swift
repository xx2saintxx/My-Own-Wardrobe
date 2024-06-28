//
//  ItemDetailView.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct ItemDetailView: View {
    @State var item: WardrobeItem
    @State private var showEditScreen = false
    @State private var showDeleteConfirmation = false
    
    var body: some View {
        VStack {
            if let image = item.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            }
            
            // Item Details
            Group {
                DetailRow(label: "Name", value: item.name)
                DetailRow(label: "Category", value: item.category)
                DetailRow(label: "Color", value: item.color)
                DetailRow(label: "Brand", value: item.brand)
                DetailRow(label: "Size", value: item.size)
            }
            .padding(.horizontal)
            
            // Edit and Delete Buttons
            HStack {
                Button(action: {
                    showEditScreen = true
                }) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showEditScreen) {
                    EditItemView(item: $item)
                }
                
                Button(action: {
                    showDeleteConfirmation = true
                }) {
                    Text("Delete")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showDeleteConfirmation) {
                    Alert(
                        title: Text("Delete Item"),
                        message: Text("Are you sure you want to delete this item?"),
                        primaryButton: .destructive(Text("Delete")) {
                            // Perform delete action
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationTitle("Item Details")
    }
}

struct DetailRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(value)
        }
        .padding(.vertical, 4)
    }
}

struct EditItemView: View {
    @Binding var item: WardrobeItem
    
    var body: some View {
        VStack {
            Text("Edit Item")
                .font(.largeTitle)
                .padding()
            
            // Fields for editing item details
            Group {
                TextField("Item Name", text: $item.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Category", text: $item.category)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Color", text: $item.color)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Brand", text: $item.brand)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Size", text: $item.size)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            
            Button(action: {
                // Save action
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top)
            }
            
            Spacer()
        }
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: WardrobeItem(name: "Red Dress", category: "Dress", color: "Red", brand: "BrandX", size: "M"))
    }
}


