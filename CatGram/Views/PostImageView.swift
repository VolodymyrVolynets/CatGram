//
//  PostImageView.swift
//  CatGram
//
//  Created by Vova on 27/09/2022.
//

import SwiftUI

struct PostImageView: View {
    
    @StateObject var vm: PostImageViewModel
    
    init(post: PostModel) {
        _vm = StateObject(wrappedValue: PostImageViewModel(post: post))
    }
    
    var body: some View {
        if let image = vm.image {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(Rectangle())
        } else {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .aspectRatio(1 ,contentMode: .fill)
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundColor(.white)
                    .scaleEffect(2)
            }
        }
        
    }
}


struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView(post: dev.post)
    }
}
