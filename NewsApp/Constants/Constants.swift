//
//  Constants.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//

import Foundation

struct Constants {
    //static let url = "https://newsapi.org/v2/everything?q=besiktas&page=1&apiKey=90f78b5e459f4557a6d285161db89387"
    static let baseUrl = "https://newsapi.org/v2/everything?q="
   // static var searchWord = String ()
    static var searchWord = "besiktas"
    static let pageUrl = "&page="
    static var pageCount = Int()
    static let apiKeyUrl = "&apiKey="
    static let apiKey = "90f78b5e459f4557a6d285161db89387"
    
    static let url = baseUrl+searchWord+pageUrl+String(pageCount)+apiKeyUrl+apiKey
    
    
    struct cell {
        static let homeCell = "HomeCell"
    }
    
    struct tableviewController {
        static let tableview = "HomeTableViewCell"
    }
}
