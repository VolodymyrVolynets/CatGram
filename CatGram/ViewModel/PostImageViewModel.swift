//
//  PostImageViewModel.swift
//  CatGram
//
//  Created by Vova on 27/09/2022.
//

import Foundation
import SwiftUI
import Combine

class PostImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    var cancelable: AnyCancellable?
    let fileManager = LocalFileManager.shared
    
    init(post: PostModel) {
        getImage(post: post)
    }
    
    private func getImage(post: PostModel) {
        if let image = fileManager.getImage(imageName: post.id) {
            self.image = image
        } else {
            guard let url = URL(string: post.url) else { return }
            downloadAndSavePostImage(from: url, imageName: post.id)
        }
    }
    
    private func downloadAndSavePostImage(from url: URL, imageName: String) {
        cancelable = NetworkManager.shared.downloadData(url: url)
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion) { [weak self] data in
                guard let self = self,
                    let safeImage = UIImage(data: data) else { return }
                self.image = safeImage
                self.saveImage(imageName: imageName)
                self.cancelable?.cancel()
            }
    }
    private func saveImage(imageName: String) {
        guard let image = self.image else {
            return }
        fileManager.saveImage(image: image, imageName: imageName)
    }
}
