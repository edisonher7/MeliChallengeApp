//
//  ProductDetailViewSpy.swift
//  MeliChallengeAppTests
//
//  Created by Edison Camilo Herrera Roldan on 28/02/22.
//

import Foundation

class ProductsDetailViewSpy {


private(set) var showProductDetail: Bool = false

private(set) var showsErrorMessageHasBeenCalled: Bool = false

func updateView() {
    showProductDetail = true
}

func showErrorWith(message: String) {
    showsErrorMessageHasBeenCalled = true
}

}
