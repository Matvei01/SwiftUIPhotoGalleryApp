//
//  SearchBar.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
            TextField("Search...", text: $text)
                .focused($isFocused)
                .padding(.horizontal, 5)
                .padding(.vertical, 15)
            Button("Delete", action: {
                text = ""
                isFocused = false
            })
            .padding(.trailing, 10)
        }
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    SearchBar(text: .constant("Text"))
}
