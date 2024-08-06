//
//  SearchBar.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
            TextField("Поиск...", text: $text)
                .padding(15)
        }
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    SearchBar(text: .constant("Text"))
}
