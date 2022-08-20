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
    var newsList = [Article]()
    //var source : NewsModel?
  //   var news: [Any] = []
    
    // MARK: - Initialierz
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    
    //MARK: - Methods
    


    
    func downloadNews( url: URL ,page : Int , searchWord : String){
   
            WebServices().downloadNewsData(url: url) { newsList in
                if let newsList = newsList {
                    self.newsList.append(contentsOf: newsList)
                    for i in newsList{
                        print(i.title)
                    }
                }
                DispatchQueue.main.async {
                   
                }
            }
        
  
    }
    
//    func downloadNews(  page : Int , searchWord : String) -> [Article]{
//        let url = URL(string:Constants.url)!
//        WebServices().downloadNewsData(url: url) { newsList in
//            if let newsList = newsList {
//                self.newsList.append(contentsOf: newsList)
//       
//            }
//            DispatchQueue.main.async {
//               
//            }
//        }
//        return newsList
//    }
    
    
}
