//
//  TabBarController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//
import UIKit

class TabBarController: UITabBarController  {
    
    
    // MARK: - Properties
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let homeViewController = Storyboard.home.viewController else {return}
        homeViewController.tabBarItem = TabBarItems.home.tabBarItem
        
        guard let favoriteViewController = Storyboard.favorite.viewController else {return}
        favoriteViewController.tabBarItem = TabBarItems.favorite.tabBarItem
        
        self.setViewControllers([homeViewController , favoriteViewController], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

