//
//  ListViewModel.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 12/04/25.
//

import Foundation

class ListViewModel {
    
    var postss = [Posts]()
    
    func fetchPosts(completion: @escaping () -> Void) {
        NetworkManager.fetchListOfItems() { posts, error in
            if let posts = posts {
                self.postss = posts
                completion()
            }
        }
    }
}
