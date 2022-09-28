//
//  NameManager.swift
//  CatGram
//
//  Created by Vova on 28/09/2022.
//

import Foundation

class NameManager {
    
    static let shared = NameManager()
    
    private init() { }
    
    struct NameConstant {
        static let firstNames = [
            "Smith",
            "Jones",
            "Williams",
            "Taylor",
            "Brown",
            "Davies",
            "Evans",
            "Thomas",
            "Johnson",
            "Wilson",
            "Robert",
            "Robinson",
            "Wright",
            "Thompson",
            "White",
            "Hall",
            "Walker",
            "Green",
            "Edwards",
            "Wood",
            "Hughes",
            "Jackson"
        ]
    }
    
    func generateNickName() -> String {
        var str = ""
        
        if Bool.random() {
            str = "\(NameConstant.firstNames.randomElement() ?? "NickName")\(Int.random(in: 0...300))"
        } else {
            str = "\(Int.random(in: 0...300))\(NameConstant.firstNames.randomElement() ?? "NickName")"
        }
        
        return str
    }
     
}
