//
//  Constants.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//

import Foundation

struct Constants {
    static var pageCount = 1
    static let url = "https://newsapi.org/v2/everything?q=besiktas&page=\(pageCount)&apiKey=90f78b5e459f4557a6d285161db89387&pageSize=6"
    static let baseUrl = "https://newsapi.org/v2"
    static let searchUrl = "/everything?q=besiktas"
    static let pageUrl = "&page="
    static let apiKeyUrl = "&apiKey=afdd6ffbe7af4785b519599df26fb67a"
    static let pageSize = "&pageSize=20"
    static let country = "/top-headlines?country=tr"
    static var homeUrl = baseUrl+country+apiKeyUrl+pageUrl+String(pageCount)+pageSize

  //  Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(page)+Constants.pageSize
    
    
    struct cell {
        static let homeCell = "HomeCell"
    }
    
    struct tableviewController {
        static let tableview = "HomeTableViewCell"
    }
}
