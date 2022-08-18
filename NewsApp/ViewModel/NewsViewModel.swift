//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//
import Foundation
import UIKit

class NewsViewModel {
    
    // MARK: - Properties
    var newsList = [NewsModel]()
    //var source : NewsModel?
     var news: [Any] = []
    
    // MARK: - Initialierz
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    
    //MARK: - Methods

    
    func downloadNews(tableView : UITableView , page : Int , searchWord : String){
      //  let url = URL(string: Constants.url)!
        let url = URL(string:Constants.baseUrl+searchWord+Constants.pageUrl+String(page)+Constants.apiKeyUrl+Constants.apiKey)!
 
        WebServices().downloadMovieData(url: url) { newsList in
            if let newsList = newsList {

                
                self.newsList.append(contentsOf: newsList)
                for n in newsList{
                    print(n.title)
                }
            }
            DispatchQueue.main.async {
                tableView.reloadData()
            }

        }
        

        
    }
    
    
}
