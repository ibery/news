//
//  Welcome.swift
//  NewsApp
//
//  Created by Narkoz on 19.08.2022.
//

// MARK: - Welcome
struct Welcome: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
