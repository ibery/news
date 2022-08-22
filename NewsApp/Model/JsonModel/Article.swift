//
//  Article.swift
//  NewsApp
//
//  Created by Narkoz on 19.08.2022.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
     init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
         source = try values.decode(Source.self , forKey: .source)
         author = try values.decodeIfPresent(String.self , forKey: .author)
         title = try values.decode(String.self , forKey: .title)
         articleDescription = try values.decode(String.self , forKey: .articleDescription)
         url = try values.decode(String.self , forKey: .url)
         urlToImage = try values.decode(String.self , forKey: .urlToImage)
         publishedAt = try values.decode(String.self , forKey: .publishedAt)
         content = try values.decodeIfPresent(String.self , forKey: .content)

    }
    init?(){
        return nil
    }
    
}

