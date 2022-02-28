//
//  ProductoDetailVC.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 24/02/22.
//

import Foundation
import UIKit

class ProductDetailVC: BaseVC<ProductDetailPresenter> {

    static let ArgProductDetailName = "ARG_PRODUCT_DETAIL_NAME"
    static let ArgProductDetailPrice = "ARG_PRODUCT_DETAIL_PRICE"
    static let ArgProductDetailCondition = "ARG_PRODUCT_DETAIL_CONDITION"
    static let ArgProductDetailImage = "ARG_PRODUCT_DETAIL_IMAGE"


    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    override func initPresenter(with context: RouteContext?) {
        presenter = ProductDetailPresenter()
        presenter?.attachView(baseView: self)
        presenter?.setContext(to: context)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        presenter?.doOnStart()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        presenter?.backButtonPressed()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
    }
}

extension ProductDetailVC: ProductDetailView {
    func updateView(withTitle name: String,condition: String, price: String, image: String) {
        nameLbl.text = name
        priceLbl.text = price
        conditionLbl.text = condition
        let url = URL(string: image)
        let data = try? Data(contentsOf: url!)
        productImg.image = UIImage(data: data!)
    }
}
