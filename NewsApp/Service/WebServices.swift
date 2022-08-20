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
    

    func downloadNewsData(url : URL , completion: @escaping ([Article]?) -> () ){
                
        AF.request(url,method: .get).responseDecodable(of: Welcome.self) {response in
            print("burası response \(response)")
            switch response.result{
            case .success(let data):
          //      self.news.append(contentsOf: data.articles)
                
                self.news += data.articles
                for i in self.news{
                    i.title
                }
                completion(self.news)
            case.failure(let error):

                print("web sevice hatası \(error)")
            }

        }
    }
    

    
}















//class WebServices {
//
//    // MARK: - Properties
//    static let sharedInstance = WebServices()
//
//    private var news = [NewsModel]()
//
//    // MARK: - Initialierz
//
//
//
//    // MARK: - Setup
//
//
//    // MARK: - Actions
//
//
//
//    //MARK: - Methods
    
//    func downloadMovieData (url : URL , completion: @escaping ([NewsModel]?) -> () ){
//        
//        
//        AF.request(url, method: .get).validate().responseJSON{ response in
//            
//            switch response.result{
//            case.success(let value):
//                
//               
//                
//                let json = JSON(value)
//                for index in 0...json.count{
//                    let newMovies = NewsModel(title: json["articles"][index]["title"].stringValue,
//                                              publishedAt: json["articles"][index]["publishedAt"].stringValue,
//                                              description: json["articles"][index]["description"].stringValue,
//                                              urlToImage: json["articles"][index]["urlToImage"].stringValue,
//                                              content: json["articles"][index]["content"].stringValue
//                                              //                  source: json["articles"][index]["source"]
//                    )
//                    
//                    self.news.append(newMovies)
//                    //       print("news \(newMovies.title)")
//                    
//                }
//                completion(self.news)
//                
//            case .failure(let error):
//                print("Error ! \(error.localizedDescription)")
//                //      UIWindow.showAlert(title: C.Error.title, message: C.Error.overView)
//            }
//        }
//        
//    }
    
    
//    func fetchNews(url : URL){
//
//        AF.request(Constants.url,method: .get ,Parameters: params,encoding: URLEncoding.queryString, headers: nil)
//            .validate()
//            .responseJSON { response in
//                switch (response.result){
//                case .success( _):
//                    do{
//                        let users = try JSONDecoder().decode([User].self , from: response.data!)
//                        print(users)
//                    }catch let error as NSError{
//                        print("hata geldi ")
//                    }
//                case .failure(let error):
//                    print("request error :")
//                }
//
//            }
//    }
//
//
//
    
    
    
//}
