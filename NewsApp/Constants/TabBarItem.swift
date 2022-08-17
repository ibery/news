//
//  TabBarItem.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import Foundation
import UIKit

enum TabBarItems: Int{
    case home
    case favorite
    
    var title : String {
        switch self {
        case .home:
            return "Home"
        case.favorite:
            return "Favorite"
        }
    }
    
    var image : UIImage? {
        switch self {
        case.home :
            return Images.home.image
        case.favorite :
            return Images.favorite.image
        }
    }
    
    var tag : Int {
        return rawValue
    }
    
    var tabBarItem : UITabBarItem {
        return UITabBarItem(title: title, image: image, tag: tag)
    }
}
