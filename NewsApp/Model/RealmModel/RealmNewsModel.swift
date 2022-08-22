//
//  RealmNewsModel.swift
//  NewsApp
//
//  Created by Narkoz on 22.08.2022.
//

import Foundation
import RealmSwift

class RealmNewsModel : Object{
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var author: String?
    @Persisted var title : String = ""
    @Persisted var articleDescription: String = ""
    @Persisted var url: String = ""
    @Persisted var urlToImage: String  = ""
    @Persisted var publishedAt: String = ""
    @Persisted var content: String?

}

