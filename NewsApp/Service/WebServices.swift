//
//  WebServices.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//
import Alamofire
import SwiftyJSON
import Foundation


class WebServices {
    
    // MARK: - Properties
    private var news = [Article]()
    
    
    // MARK: - Initialierz
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    
    func downloadNewsData( url : URL,completion: @escaping ([Article]?) -> () ){
        
        AF.request(url,method: .get).responseDecodable(of: Welcome.self) {response in
            
            switch response.result{
            case .success(let data):
                self.news += data.articles
                completion(self.news)
            case.failure(let error):
                UIWindow.showAlert(title: Constants.Error.title, message: Constants.Error.networkError)
            }
            
        }
    }
    
}





