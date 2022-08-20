//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Narkoz on 18.08.2022.
//


import UIKit

class DetailViewController : BaseViewController  {
    
    
    // MARK: - Properties
    var newsModel = Article()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("burası detail viewcontroller")
     //   print(newsModel.title)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
   
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    @IBAction func NewsSourceButtonClick(_ sender: UIButton) {
        guard let viewController = Storyboard.source.viewController else {return}
        self.navigationController?.show(viewController, sender: nil)
    }
    
    
    //MARK: - Methods
    
}

