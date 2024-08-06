//
//  PhotoGalleryView.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import SwiftUI

struct PhotoGalleryView: View {
    @ObservedObject private var viewModel = ObservablePhotoViewModel()
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchTerm)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.photos) { photo in
                            PhotoView(photo: photo)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Photos")
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    PhotoGalleryView()
}
