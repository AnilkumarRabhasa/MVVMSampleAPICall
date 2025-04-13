//
//  ListCodable.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 13/04/25.
//

import Foundation

struct Posts: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
