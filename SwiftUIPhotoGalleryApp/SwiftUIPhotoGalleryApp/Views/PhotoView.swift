//
//  PhotoView.swift
//  SwiftUIPhotoGalleryApp
//
//  Created by Matvei Khlestov on 06.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoView: View {
    let photo: UnsplashPhoto
    
    var body: some View {
        if let urlString = photo.urls[PhotoSize.regular.rawValue],
           let url = URL(string: urlString) {
            WebImage(url: url) { image in
                image.resizable()
            } placeholder: {
                Rectangle().foregroundStyle(.gray)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.6))
            .scaledToFill()
            .frame(minWidth: 170, minHeight: 170)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

