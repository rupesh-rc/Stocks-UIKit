//
//  ViewController.swift
//  Stocks-UIKit
//
//  Created by Rupesh on 18/12/21.
//

import UIKit

class WatchListVC: UIViewController {

    
    //MARK:- LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupTitleView()
    }
    
    //MARK:- PRIVATE

    private func setupTitleView() {
        let titleView = UIView (frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height-10))
        label.text = "Stocks"
        label.textColor = .white
        label.font = .systemFont(ofSize: 38, weight: .medium)
        titleView.addSubview(label)
        navigationItem.titleView = titleView
    }
    
    private func setupSearchController() {
        let resultVC = SearchResultVC()
        resultVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    
}



extension WatchListVC : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              let resultVC = searchController.searchResultsController as? SearchResultVC,
              !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        print(text)
        
        //UPDATE RESULTVC
        resultVC.update(with: ["APPL"])
    }
    
    
}


extension WatchListVC : SearchResultVCDelegate {
    func SearchResultVCDidSelect(searchResult: String) {
        print(searchResult)
    }
}
