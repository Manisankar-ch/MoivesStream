//
//  MoviesStreamHelper.swift
//  MoivesStream
//
//  Created by Mani Sankar on 26/10/24.
//

import Foundation
import UIKit

class MoviesStreamHelper {
    static func loadJSON() -> [VideoModel]? {
        guard let url = Bundle.main.url(forResource: "Videos", withExtension: "json") else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let videos = try JSONDecoder().decode([VideoModel].self, from: data)
            return videos
        } catch {
            print("Failed to load JSON: \(error)")
            return nil
        }
    }
    
    static func loadImage(url: URL, imageView: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
