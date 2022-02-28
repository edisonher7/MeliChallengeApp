//
//  ProductsListPresenter.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 20/02/22.
//

import Foundation

class ProductsListPresenter: BasePresenter<ProductsView> {

    var productsList = [ProductItem]()

    private let service = ApiClientService.shared
    
    func selectedCell(withRow: Int) {
        let parameters = [ProductDetailVC.ArgProductDetailName: productsList[withRow].name ?? "", ProductDetailVC.ArgProductDetailPrice: productsList[withRow].installments.amount?.description ?? "", ProductDetailVC.ArgProductDetailImage: productsList[withRow].urlImage,ProductDetailVC.ArgProductDetailCondition: productsList[withRow].condition ?? ""] as [String : Any]
        let context = RouteContext(parameters)
        baseView?.openChildScreen(.productDetail, fromStoryboard: .main, withContext: context)
    }

    func doOnStart(keyWord: String) {
        fetchProducts(keyWord: keyWord)
    }
    
    func clearData(){
        
        productsList.removeAll()
        self.baseView?.updateList()
        
    }

    private func fetchProducts(keyWord :String) {
        service.getProductList(completion: {(list, error) in
            if let list = list {
                self.productsList = list.RsProductList.reversed()
                self.baseView?.updateList()
            }
        }, keyWorld: keyWord)
    }
}
