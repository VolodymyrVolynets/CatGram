//
//  HomeViewModel.swift
//  CatGram
//
//  Created by Vova on 27/09/2022.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancelable = Set<AnyCancellable>()
    
    init() {
       generatePost5()
    }
    
    //if post was seen create a new one
    func postAppeared(_ post: Binding<PostModel>) {
        if post.wrappedValue.wasSeen == nil {
            post.wrappedValue.wasSeen = true
            getNewPost()
        }
    }
    
    private func getNewPost() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }
        NetworkManager.shared.downloadData(url: url)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion) { [weak self] modelArr in
                guard let self = self,
                      let model = modelArr.first else {
                    return
                }
                self.posts.append(model)
            }
            .store(in: &cancelable)
    }
    
    private func generatePost5() {
        for _ in 0...5 {
            getNewPost()
        }
    }
}

