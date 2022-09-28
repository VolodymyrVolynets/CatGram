//
//  LocalFileManager.swift
//  CatGram
//
//  Created by Vova on 27/09/2022.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    private let manager = FileManager.default
    
    private init() { }
    
    func saveImage(image: UIImage, folderName: String = "CatGram", imageName: String) {
        createFolderIfNeeded(folderName: folderName)
        guard let url = getImagePath(folderName: folderName, imageName: imageName),
              let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        do {
            try imageData.write(to: url)
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func getImage(imageName: String, folderName: String = "CatGram") -> UIImage? {
        guard let url = getImagePath(folderName: folderName, imageName: imageName),
              !manager.fileExists(atPath: url.absoluteString),
        let data = try? Data(contentsOf: url) else {
            return nil
        }
        let image = UIImage(data: data)
        return image
    }
    
    func getFolderURL(folderName: String) -> URL? {
        guard let url = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    func getImagePath(folderName: String, imageName: String) -> URL?{
        guard let url = getFolderURL(folderName: folderName) else {
            return nil
        }
        return url.appendingPathComponent("\(imageName).jpg")
    }
    
    func createFolderIfNeeded(folderName: String) {
        guard let url = getFolderURL(folderName: folderName) else {
            return }
        if !manager.fileExists(atPath: url.absoluteString) {
            do {
                try manager.createDirectory(at: url, withIntermediateDirectories: true)
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
    }
}
