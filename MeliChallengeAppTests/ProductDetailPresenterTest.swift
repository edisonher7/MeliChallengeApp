//
//  ProductDetailPresenterTest.swift
//  MeliChallengeAppTests
//
//  Created by Edison Camilo Herrera Roldan on 28/02/22.
//

import XCTest

@testable import MeliChallengeApp

class ProductDetailPresenterTest: XCTestCase {

    private var productsDetailView: ProductsDetailViewSpy!
    private var productDetailPresenter: ProductDetailPresenter!
    
    
    func testShowProductDetail() {
        givenAProductsViewSpy()
        showProductDetail()
        thenTheProductListIsDisplayed()
       }
    
    private func showProductDetail() {
        productDetailPresenter?.doOnStart()
        }
    
    private func givenAProductsViewSpy() {
        productsDetailView = ProductsDetailViewSpy()
        productsDetailView.updateView()
    }
        
    private func thenTheProductListIsDisplayed() {
        XCTAssertTrue(productsDetailView.showProductDetail)
    }

}
