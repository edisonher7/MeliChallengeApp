//
//  ProductDetailView.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 24/02/22.
//

import Foundation

protocol ProductDetailView: BaseView {
    func updateView(withTitle name: String, condition: String, price: String, image: String)
}
