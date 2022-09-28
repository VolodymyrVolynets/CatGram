//
//  CatImageModel.swift
//  CatGram
//
//  Created by Vova on 27/09/2022.
//

import Foundation

struct PostModel: Codable, Identifiable {
    let id: String
    let url: String
    var wasSeen: Bool?
}
