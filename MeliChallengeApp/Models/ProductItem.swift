//
//  ProductItem.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 20/02/22.
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case name = "title"
    case condition = "condition"
    case installments = "installments"
    case urlImage = "thumbnail"
}


struct ProductItem {
    let name: String?
    let condition: String?
    let installments: Installments
    let urlImage: String
}

extension ProductItem: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.condition = try container.decode(String.self, forKey: .condition)
        self.installments = try container.decode(Installments.self, forKey: .installments)
        self.urlImage = try container.decode(String.self, forKey: .urlImage)
    }
}
