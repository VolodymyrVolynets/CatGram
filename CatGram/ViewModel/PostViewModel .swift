//
//  PostViewModel .swift
//  CatGram
//
//  Created by Vova on 28/09/2022.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var post: PostModel
    @Published var isLiked = false
    @Published var wasSeen = false
    @Published var nickName = NameManager.shared.generateNickName()
    
    init(post: PostModel) {
        self.post = post
    }
    
    func postWasSeen() {
        self.wasSeen = true
    }
    
    func likeButtonPressed() {
        self.isLiked.toggle()
    }
}
