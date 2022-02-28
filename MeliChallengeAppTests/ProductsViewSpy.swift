//
//  ProductsViewSpy.swift
//  MeliChallengeAppTests
//
//  Created by Edison Camilo Herrera Roldan on 25/02/22.
//

import Foundation
import MeliChallengeApp

class ProductsViewSpy {

        private(set) var showProductList: Bool = false
        private(set) var showLoadingStatusHasBeenCalled: Bool = false
        private(set) var hideLoadingStatusHasBeenCalled: Bool = false
        private(set) var showsErrorMessageHasBeenCalled: Bool = false
        
        func updateList() {
            showProductList = true
        }
        
        func showLoadingStatus() {
            showLoadingStatusHasBeenCalled = true
        }
        
        func hideLoadingStatus() {
            hideLoadingStatusHasBeenCalled = true
        }
        
        func showErrorWith(message: String) {
            showsErrorMessageHasBeenCalled = true
        }
        
}

   
