//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Narkoz on 18.08.2022.
//


import UIKit

class DetailViewController : BaseViewController  {
    
    
    // MARK: - Properties
    var newsModel = NewsModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("burası detail viewcontroller")
        print(newsModel.title)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

