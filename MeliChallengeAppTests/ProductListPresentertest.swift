//
//  ProductListPresentertest.swift
//  MeliChallengeAppTests
//
//  Created by Edison Camilo Herrera Roldan on 25/02/22.
//

import XCTest


@testable import MeliChallengeApp

class ProductListPresentertest: XCTestCase {

    private var productsView: ProductsViewSpy!
    private var productListPresenter: ProductsListPresenter!
    
    
    func testShowProductList() {
        givenAProductsViewSpy()
        givenAProductList()
        thenTheProductListIsDisplayed()
       }
    
    private func givenAProductList() {
        productListPresenter?.doOnStart(keyWord: "motorola")

        }
    private func givenAProductsViewSpy() {
        productsView = ProductsViewSpy()
        productsView.updateList()
    }
        
    private func thenTheProductListIsDisplayed() {
        XCTAssertTrue(productsView.showProductList)
    }
    
    private func thenTheProductLoadingIsShown() {
        XCTAssertTrue(productsView.showLoadingStatusHasBeenCalled)
    }
    
    
    private func thenAnErrorMessageIsDisplayed() {
        XCTAssertTrue(productsView.showsErrorMessageHasBeenCalled)
    }


}
