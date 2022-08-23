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
    var newsUrl = String()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webViwUrl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "News Source"
    }
    
    // MARK: - Setup
    private func webViwUrl() {
        
        guard let url = URL(string: newsUrl) else {return}
        let request = URLRequest(url : url)
        webView.loadRequest(request)
        
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

