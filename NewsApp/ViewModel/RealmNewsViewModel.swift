//
//  RealmNewsViewModel.swift
//  NewsApp
//
//  Created by Narkoz on 22.08.2022.
//

import Foundation
import RealmSwift
import UIKit


class RealmNewsViewModel {
    
    // MARK: - Properties
    
    let realm = try! Realm()
    private var realmModel : Results<RealmNewsModel>?
    
    // MARK: - Initialierz
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    
    //MARK: - Methods
    
    func addFavorite(realmNewsModel : RealmNewsModel){
        do{
            try realm.write{
                realm.add(realmNewsModel)
            }
        }catch{
            print(error.localizedDescription)
            UIWindow.showAlert(title: Constants.Error.title, message: Constants.Error.overView)
        }
    }
    
    func getFavorite() -> Results<RealmNewsModel>? {
        let realmNewsModel = realm.objects(RealmNewsModel.self)
        return realmNewsModel
    }
    
    
}
