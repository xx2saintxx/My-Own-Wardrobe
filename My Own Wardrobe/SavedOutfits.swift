//
//  SavedOutfits.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import SwiftUI

struct SavedOutfitsView: View {
    @State private var savedOutfits = [
        Outfit(name: "Casual Outfit", items: ["Blue Jeans", "Green Shirt"], date: Date()),
        Outfit(name: "Party Outfit", items: ["Red Dress", "Black Heels"], date: nil)
    ]
    @State private var showEditScreen = false
    @State private var outfitToEdit: Outfit?
    @State private var showDeleteConfirmation = false
    @State private var outfitToDelete: Outfit?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(savedOutfits) { outfit in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(outfit.name)
                                    .font(.headline)
                                Text("Items: \(outfit.items.joined(separator: ", "))")
                                    .font(.subheadline)
                                if let date = outfit.date {
                                    Text("Planned for: \(date, formatter: dateFormatter)")
                                        .font(.subheadline)
                                }
                            }
                            Spacer()
                            Button(action: {
                                outfitToEdit = outfit
                                showEditScreen = true
                            }) {
                                Image(systemName: "pencil")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .padding(.trailing, 10)
                            Button(action: {
                                outfitToDelete = outfit
                                showDeleteConfirmation = true
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                // Calendar View
                CalendarView(savedOutfits: savedOutfits)

                Spacer()
            }
            .navigationTitle("Saved Outfits")
            .sheet(isPresented: $showEditScreen) {
                if let outfitToEdit = outfitToEdit {
                    EditOutfitView(outfit: outfitToEdit, onSave: { updatedOutfit in
                        if let index = savedOutfits.firstIndex(where: { $0.id == updatedOutfit.id }) {
                            savedOutfits[index] = updatedOutfit
                        }
                    })
                }
            }
            .alert(isPresented: $showDeleteConfirmation) {
                Alert(
                    title: Text("Delete Outfit"),
                    message: Text("Are you sure you want to delete this outfit?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let outfitToDelete = outfitToDelete, let index = savedOutfits.firstIndex(where: { $0.id == outfitToDelete.id }) {
                            savedOutfits.remove(at: index)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

struct EditOutfitView: View {
    @State var outfit: Outfit
    var onSave: (Outfit) -> Void

    var body: some View {
        VStack {
            TextField("Outfit Name", text: $outfit.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Items", text: Binding(
                get: { outfit.items.joined(separator: ", ") },
                set: { outfit.items = $0.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
            ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            DatePicker("Planned Date", selection: Binding(
                get: { outfit.date ?? Date() },
                set: { outfit.date = $0 }
            ), displayedComponents: .date)
                .padding()
            Button(action: {
                onSave(outfit)
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
        .padding()
    }
}

struct CalendarView: View {
    var savedOutfits: [Outfit]

    var body: some View {
        VStack {
            Text("Outfit Planning Calendar")
                .font(.headline)
                .padding()
            // Here you can add a calendar view implementation
            // For simplicity, we're showing planned outfits
            List {
                ForEach(savedOutfits.filter { $0.date != nil }) { outfit in
                    HStack {
                        Text(outfit.name)
                        Spacer()
                        Text(outfit.date!, formatter: dateFormatter)
                    }
                }
            }
            .frame(height: 200)
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

struct SavedOutfitsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedOutfitsView()
    }
}

