//
//  ApiClientService.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 21/02/22.
//

import Foundation
import Alamofire

class ApiClientService{
    
    static var shared: ApiClientService {
        return ApiClientService()
    }
    
    let baseUrlString = "https://api.mercadolibre.com/sites/MLA/search?q="
    let postsQuerySring = ""
        
    func getProductList(completion: @escaping (RsProductList?, Error?) -> Void, keyWorld : String) {
        let urlString = baseUrlString + keyWorld
        AF.request(urlString).responseJSON { response in
            print("Result: \(response.result)")

            guard let data = response.data, let entity: RsProductList = try? JSONDecoder().decode(RsProductList.self, from: data) else {
                print("Error parsing \(RsProductList.self)")
                return
            }
            completion(entity, response.error)
        }
    }

}
