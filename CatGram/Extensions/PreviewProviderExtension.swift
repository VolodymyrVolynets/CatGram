//
//  PreviewProviderExtension.swift
//  CatGram
//
//  Created by Vova on 28/09/2022.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let post = PostModel(id: "MTg4ODgzNw", url: "https://cdn2.thecatapi.com/images/MTg4ODgzNw.jpg")
    
    private init() {  }
}
