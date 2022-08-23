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

class NewsViewModel {
    
    // MARK: - Properties
    var dataArray = [Article]()
    var dataSearchArray = [Article]()
    var delegate : NewsViewModelDelegate?
    
    // MARK: - Initialierz
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func downloadNews( url : String){
        
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
                self.dataSearchArray.removeAll()
                self.dataSearchArray.append(contentsOf: newsList)
                print("search fonksiyonu \(self.dataSearchArray)")
            }
            self.delegate?.newsDataSearchFetch(dataSearchArray: self.dataSearchArray)
            
        }
    }
}


