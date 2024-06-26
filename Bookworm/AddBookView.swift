//
//  AddBookView.swift
//  Bookworm
//
//  Created by Woodrow Martyr on 24/3/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var missingInfoAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                Section {
                    Button("Save") {
                        if title.isEmpty || author.isEmpty {
                            missingInfoAlert = true
                        } else {
                            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                            modelContext.insert(newBook)
                            dismiss()
                        }
                        
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Missing Details", isPresented: $missingInfoAlert) {
                Button("Ok", role: .cancel, action: {})
            }message: {
                Text("Please enter title and author")
            }
        }
    }
}

#Preview {
    AddBookView()
}
