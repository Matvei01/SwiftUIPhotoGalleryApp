//
//  SearchResponse.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import Foundation

struct SearchResponse: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable, Identifiable {
    var id: UUID = UUID()
    let urls: [PhotoSize.RawValue: String]
}

enum PhotoSize: String {
    case raw
    case full
    case regular
    case small
    case thumb
}
