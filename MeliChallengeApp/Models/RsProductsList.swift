//
//  RsProductsList.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 19/02/22.
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case productsList = "results"
}

struct RsProductList {
    let RsProductList: [ProductItem]
}

extension RsProductList: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.RsProductList = try container.decode([ProductItem].self, forKey: .productsList)
    }
}
