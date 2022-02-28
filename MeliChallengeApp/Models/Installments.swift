//
//  Installments.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 22/02/22.
//

import Foundation
struct Installments : Codable {
    let quantity : Int?
    let amount : Double?
    let rate : Double?
    let currency_id : String?

    enum CodingKeys: String, CodingKey {

        case quantity = "quantity"
        case amount = "amount"
        case rate = "rate"
        case currency_id = "currency_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        amount = try values.decodeIfPresent(Double.self, forKey: .amount)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
    }

}
