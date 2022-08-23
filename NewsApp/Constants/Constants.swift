//
//  Constants.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//

import Foundation

struct Constants {
    static var pageCount = 1
    static let baseUrl = "https://newsapi.org/v2"
    static let searchUrl = "/everything?q="
    static let pageUrl = "&page="
    static let apiKeyUrl = "&apiKey=82e8c07a923d41acb15f3dda636a3234"
    static let pageSize = "&pageSize=20"
    static let country = "/top-headlines?country=tr"
    static var homeUrl = baseUrl+country+apiKeyUrl+pageUrl+String(pageCount)+pageSize
    //   static var yedekApi = "acc4eef67cf146daa86aa088baed8d42"
    // orjinal api afdd6ffbe7af4785b519599df26fb67a
    //82e8c07a923d41acb15f3dda636a3234
    
    struct cell {
        static let homeCell = "HomeCell"
    }
    
    struct tableviewController {
        static let homeTableView = "HomeTableViewCell"
    }
    struct Error {
        static let title = " Warning !"
        static let overView = "Unexpected Error Occurred !"
        static let networkError = "Network Error ! "
        static let notFound = "The news you were looking for was not found !"
        static let notSuccessful = "Deletion is not successful"
    }
}
