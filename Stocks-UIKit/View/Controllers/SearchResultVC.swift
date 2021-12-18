//
//  SearchResultVC.swift
//  Stocks-UIKit
//
//  Created by Rupesh on 17/12/21.
//

import UIKit

protocol SearchResultVCDelegate : AnyObject {
    func SearchResultVCDidSelect(searchResult : String)
}

class SearchResultVC: UIViewController {
    
    weak var delegate : SearchResultVCDelegate?
    
    private var results : [String] = []
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.id)
        
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
   private func setupTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    
    }
    
    public func update(with result:[String]) {
        self.results = result
        tableView.reloadData()
    }

}



extension SearchResultVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.id, for: indexPath) as! SearchResultTableViewCell
        cell.textLabel?.text = "APPL"
        cell.detailTextLabel?.text = "Apple Inc."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.SearchResultVCDidSelect(searchResult: "APPL")
    }
}
