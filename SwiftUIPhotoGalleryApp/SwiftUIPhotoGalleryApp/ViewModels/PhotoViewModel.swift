//
//  PhotoViewModel.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import Foundation

protocol PhotoViewModelDelegate: AnyObject {
    func didUpdatePhotos(_ photos: [UnsplashPhoto])
    func didFailWithError(_ error: Error)
}

final class PhotoViewModel {
    
    private var photos: [UnsplashPhoto] = [] {
        didSet {
            delegate?.didUpdatePhotos(photos)
        }
    }
    
    weak var delegate: PhotoViewModelDelegate?
    
    private let networkDataFetcher = NetworkDataFetcher.shared
    
    var searchTerm: String = "" {
        didSet {
            searchPhotos()
        }
    }
    
    private func searchPhotos() {
        guard !searchTerm.isEmpty else { return }
        networkDataFetcher.fetchData(SearchResponse.self, searchTerm: searchTerm) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.photos = response.results
            case .failure(let error):
                self.delegate?.didFailWithError(error)
            }
        }
    }
}
