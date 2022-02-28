//
//  ViewController.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 19/02/22.
//

import UIKit

class ProductsListVC: BaseVC<ProductsListPresenter> {
    
    var keyWord = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: ProductTableViewCell.cellIdent, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: ProductTableViewCell.cellIdent)
        }
    }

    override func initPresenter(with context: RouteContext?) {
        presenter = ProductsListPresenter()
        presenter?.attachView(baseView: self)
        presenter?.setContext(to: context)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        presenter?.doOnStart(keyWord: "motorola")
        
        searchBar.delegate = self

    }
    

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

extension ProductsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.productsList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellIdent, for: indexPath) as? ProductTableViewCell, let product = presenter?.productsList[indexPath.row] {
            cell.setProduct(product)
            return cell
        } else {
            return ProductTableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductTableViewCell.cellHeight
    }
}

extension ProductsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedCell(withRow: indexPath.row)
    }

}

extension ProductsListVC: ProductsView {
    func updateList() {
        self.tableView.tableFooterView = UIView()
        tableView.reloadData()
        tableView.hideActivityIndicator()
    }
}

extension ProductsListVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != ""
        {
            presenter?.clearData()
            self.keyWord = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload), object: nil)
            self.perform(#selector(self.reload), with: nil, afterDelay: 0.5)
        }
        
    }
    
    @objc func reload() {
        print("Doing things")
        tableView.showActivityIndicator()
        presenter?.doOnStart(keyWord: self.keyWord)
    }
}

extension UITableView {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let activityView = UIActivityIndicatorView(style: .medium)
            self.backgroundView = activityView
            activityView.startAnimating()
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.backgroundView = nil
        }
    }
}
