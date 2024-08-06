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
                    // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                    .onSuccess { image, data, cacheType in
                        // Success
                        // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFill()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
}

//#Preview {
//    PhotoView(photo: <#UnsplashPhoto#>)
//}
