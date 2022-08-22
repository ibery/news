//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//
import Foundation
import UIKit

protocol NewsViewModelDelegate{
    func newsDataFetch(dataArray: [Article])
    func newsDataSearchFetch(dataSearchArray : [Article])
}

//protocol NewsViewModelSearchDelegate{
//    func newsDataSearchFetch(dataSearchArray : [Article])
//}

class NewsViewModel {
    
    // MARK: - Properties
    var dataArray = [Article]()
    var dataSearchArray = [Article]()
    //var source : NewsModel?

    var delegate : NewsViewModelDelegate?
 //   var delegateSearch : NewsViewModelSearchDelegate?
    
    
    // MARK: - Initialierz
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func downloadNews( url : String){
        print("page count \(Constants.pageCount)")
  
       guard let url = URL(string: url ) else {return}
        
        WebServices().downloadNewsData(url: url) { newsList in
                if let newsList = newsList {
                    self.dataArray.append(contentsOf: newsList)
   
                }
                    self.delegate?.newsDataFetch(dataArray: self.dataArray)
            }
    }
    
    func downloadSearchNews ( url : String , searchWord : String){
        guard let url = URL(string: url) else {return }
        
        WebServices().downloadNewsData(url: url){ newsList in
            if let newsList = newsList {
                self.dataSearchArray.append(contentsOf: newsList)
                print("search fonksiyonu \(self.dataSearchArray)")
            }
            self.delegate?.newsDataSearchFetch(dataSearchArray: self.dataSearchArray)
            
        }
    }
    
//    func downloadNewsHome(){
//        guard let url = URL(string: Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.pageSize) else {return}
//
//        WebServices().downloadNewsData(url: url){ newList in
//            if let newList = newList {
//                self.dataArray.append(contentsOf: newList)
//            }
//
//        }
//    }
//

    
}


//Constants.baseUrl+Constants.searchUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.apiKeyUrl+Constants.pageSize

//     guard let url = URL(string: Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.pageSize) else {return}
