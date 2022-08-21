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
}

class NewsViewModel {
    
    // MARK: - Properties
    var dataArray = [Article]()
    //var source : NewsModel?

    var delegate : NewsViewModelDelegate?
    
    
    // MARK: - Initialierz
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func downloadNews( searchWord : String?){
        print("page count \(Constants.pageCount)")
        
        guard let url = URL(string: Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.pageSize) else {return}
        
  //     guard let url = URL(string: Constants.baseUrl+Constants.searchUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.apiKeyUrl+Constants.pageSize) else {return}
        print("url : \(url)")
        
        WebServices().downloadNewsData(url: url) { newsList in
                if let newsList = newsList {
                    self.dataArray.append(contentsOf: newsList)
       //             print("viewmodel")
                    for i in newsList{
         //               print(i.title)
                    }
                }
                    self.delegate?.newsDataFetch(dataArray: self.dataArray)
            }
    }
    
    func downloadNewsHome(){
        guard let url = URL(string: Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+String(Constants.pageCount)+Constants.pageSize) else {return}
        
        WebServices().downloadNewsData(url: url){ newList in
            if let newList = newList {
                self.dataArray.append(contentsOf: newList)
            }
            
        }
    }
    

    
}


