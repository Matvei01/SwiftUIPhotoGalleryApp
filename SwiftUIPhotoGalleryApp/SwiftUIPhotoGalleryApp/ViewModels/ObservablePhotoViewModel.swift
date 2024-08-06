//
//  ObservablePhotoViewModel.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import Foundation

final class ObservablePhotoViewModel: ObservableObject {
    @Published var photos: [UnsplashPhoto] = []
    
    var searchTerm: String = "" {
        didSet {
            viewModel.searchTerm = searchTerm
        }
    }
    
    private var viewModel = PhotoViewModel()
    
    init() {
        viewModel.delegate = self
    }
}

extension ObservablePhotoViewModel: PhotoViewModelDelegate {
    func didUpdatePhotos(_ photos: [UnsplashPhoto]) {
        self.photos = photos
    }
    
    func didFailWithError(_ error: Error) {
        print("Error fetching photos: \(error)")
    }
}
