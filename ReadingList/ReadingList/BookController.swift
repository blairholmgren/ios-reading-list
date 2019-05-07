//
//  BookController.swift
//  ReadingList
//
//  Created by Blair Holmgren on 5/7/19.
//  Copyright © 2019 Blair Holmgren. All rights reserved.
//

import Foundation

class BookController {
    
    func addBook(withTitle title: String, withReason reasonToRead: String, hasBeenRead: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        books.append(book)
        saveToPersistentStore()
    }
    
       
    }
    
    func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(books)
            try data.write(to: url)
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ReadingList.plist")
    }
    private(set) var books: [Book] = []
}
