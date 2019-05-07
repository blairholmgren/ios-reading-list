//
//  Book.swift
//  ReadingList
//
//  Created by Blair Holmgren on 5/7/19.
//  Copyright © 2019 Blair Holmgren. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.hasBeenRead = hasBeenRead
        self.title = title
        self.reasonToRead = reasonToRead
    }
    
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    
}
