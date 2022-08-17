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
    
    private var news = [NewModel]()
    
    // MARK: - Initialierz
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    
    //MARK: - Methods
    
    func downloadMovieData (url : URL , completion: @escaping ([NewModel]?) -> () ){
        AF.request(url, method: .get).validate().responseJSON{ response in
            switch response.result{
            case.success(let value):
                let json = JSON(value)
                for index in 0...json.count{
                    let newMovies = NewModel(title: json["articles"][index]["title"].stringValue)
                                               
                    self.news.append(newMovies)
                 //   print("news \(newMovies)")
 
                }
                completion(self.news)
  
            case .failure(let error):
                print("Error ! \(error.localizedDescription)")
          //      UIWindow.showAlert(title: C.Error.title, message: C.Error.overView)
            }
        }
    }
    
}
