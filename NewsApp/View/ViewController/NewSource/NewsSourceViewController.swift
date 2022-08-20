//
//  NewsSourceViewController.swift
//  NewsApp
//
//  Created by Narkoz on 18.08.2022.
//

import UIKit

class NewsSourceViewController : BaseViewController  {
    
    
    // MARK: - Properties
    @IBOutlet var webView: UIWebView!
    @IBOutlet var newsSourceLabel: UILabel!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.title = "News Source"
        
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

