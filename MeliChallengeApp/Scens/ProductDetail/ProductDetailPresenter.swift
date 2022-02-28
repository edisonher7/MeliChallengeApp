//
//  ProductDetailPresenter.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 24/02/22.
//

import Foundation

class ProductDetailPresenter: BasePresenter<ProductDetailView> {
    
    private var productName: String?
    private var productPrice: String?
    private var productImage: String?
    private var productCondition: String?


    
    override func setContext(to context: RouteContext?) {
        guard let context = context else {
            return
        }
        productName = context[ProductDetailVC.ArgProductDetailName]
        productPrice = context[ProductDetailVC.ArgProductDetailPrice]
        productImage = context[ProductDetailVC.ArgProductDetailImage]
        productCondition = context[ProductDetailVC.ArgProductDetailCondition]


    }

    func backButtonPressed() {
        baseView?.backToPrevScreen(with: nil)
    }

    func doOnStart() {
        baseView?.updateView(withTitle: productName ?? "", condition: productCondition ?? "", price: productPrice ?? "", image: productImage ?? "")
    }
}
