//
//  Images.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import Foundation
import UIKit

enum Images: Int {
    case home
    case favorite
    
    var imageName : String{
        switch self {
        case .home:
            return "home"
        case.favorite:
            return "favorite"
        }
    }
    
    var image : UIImage?{
        return UIImage(named: self.imageName)
    }
}
