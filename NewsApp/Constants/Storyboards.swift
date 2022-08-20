//
//  Storyboards.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import Foundation
import UIKit

enum Storyboard : Int {
    
    case home
    case favorite
    case splash
    case detail
    case source
    
    var name : String {
        switch self{
        case .home:
            return "Home"
        case.favorite:
            return "Favorite"
        case.splash:
            return "Splash"
        case.detail:
            return "Detail"
        case.source:
            return "Source"
        }
    }
    var storyboard : UIStoryboard {
        return UIStoryboard(name: "\(self.name)Screen", bundle: nil)
    }
    var viewController : UIViewController?{
        return self.storyboard.instantiateInitialViewController()
    }
    
}
