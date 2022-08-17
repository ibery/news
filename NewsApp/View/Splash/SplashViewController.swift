//
//  SplashViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit

class SplashViewController : BaseViewController  {
    
    
    // MARK: - Properties
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            let tabBarController = TabBarController()
            self.show(tabBarController, sender: nil)
        }
        
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

