//
//  SplashViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit

class SplashViewController : BaseViewController  {
    
    
    // MARK: - Properties
    @IBOutlet var newsImage: UIImageView!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func ImageAnimation(){
        UIView.animate(withDuration: 2, animations: {
            self.newsImage.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: {(true) in
            self.showHomePage()
        } )
    }
    
    func showHomePage(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            let tabBarController = TabBarController()
            self.show(tabBarController, sender: nil)
        }
    }
    
}

