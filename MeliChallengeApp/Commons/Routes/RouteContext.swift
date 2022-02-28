//
//  RouteContext.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 21/02/22.
//

import Foundation

protocol RoutableScreen {
    var context: RouteContext? { get set }
}

struct RouteContext {
    private let params: [String: Any]
    
    subscript<T>(key: String) -> T? {
        return params[key] as? T
    }
    
    init(_ params: [String: Any]) {
        self.params = params
    }
}
