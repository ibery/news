//
//  Constants.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//

import Foundation

struct Constants {
    static var pageCount = 1
    static let url = "https://newsapi.org/v2/everything?q=besiktas&page=\(pageCount)&apiKey=90f78b5e459f4557a6d285161db89387&pageSize=20"
    static let baseUrl = "https://newsapi.org/v2"
    static let searchUrl = "/everything?q="
    static let pageUrl = "&page="
    static let apiKeyUrl = "&apiKey=acc4eef67cf146daa86aa088baed8d42"
    static let pageSize = "&pageSize=20"
    static let country = "/top-headlines?country=tr"
    static var homeUrl = baseUrl+country+apiKeyUrl+pageUrl+String(pageCount)+pageSize
 //   static var yedekApi = "acc4eef67cf146daa86aa088baed8d42"
    // orjinal api afdd6ffbe7af4785b519599df26fb67a
//    static var genelUrl = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=afdd6ffbe7af4785b519599df26fb67a"

  //  Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(page)+Constants.pageSize
    
    
    struct cell {
        static let homeCell = "HomeCell"
    }
    
    struct tableviewController {
        static let tableview = "HomeTableViewCell"
    }
}
