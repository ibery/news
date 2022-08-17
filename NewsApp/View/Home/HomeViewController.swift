//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit

class HomeViewController : BaseViewController  {
    
    
    // MARK: - Properties
  private var newsList = [NewModel]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
            
        let url = URL(string: Constants.url)!
            WebServices().downloadMovieData(url: url) { newsList in
                if let newsList = newsList {
                   
                    for n in newsList{
                        print(n.title)
                    }
                    
                    }
                    DispatchQueue.main.async {
                        for n in self.newsList{
                   //         print("dispact q \(n.title)")
                        }
                        
                    }
                
            }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

