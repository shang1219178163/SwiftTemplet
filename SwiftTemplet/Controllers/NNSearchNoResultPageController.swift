//
//  NNSearchNoResultPageController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit


struct Model {
    let movie: String
    let genre: String
}


class NNSearchNoResultPageController: UITableViewController {

    var models = [Model]()
    var filteredModels = [Model]()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search by name or genre"
        searchController.searchBar.backgroundColor = .theme
        searchController.searchBar.tintColor = .black
        searchController.searchBar.textField?.backgroundColor = .white
        searchController.searchBar.textField?.layer.cornerRadius = 5;
        searchController.searchBar.textField?.layer.masksToBounds = true
        
        definesPresentationContext = true
        return searchController
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 11, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        self.tableView.tableFooterView = UIView()
                
        models = [
            Model(movie:"The Dark Night", genre:"Action"),
            Model(movie:"The Avengers", genre:"Action"),
            Model(movie:"Logan", genre:"Action"),
            Model(movie:"Shutter Island", genre:"Thriller"),
            Model(movie:"Inception", genre:"Thriller"),
            Model(movie:"Titanic", genre:"Romance"),
            Model(movie:"La la Land", genre:"Romance"),
            Model(movie:"Gone with the Wind", genre:"Romance"),
            Model(movie:"Godfather", genre:"Drama"),
            Model(movie:"Moonlight", genre:"Drama")
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCell", style: .subtitle)

        let model: Model
        if searchController.isActive && searchController.searchBar.text != "" {
            model = filteredModels[indexPath.row]
        } else {
            model = models[indexPath.row]
        }
        cell.textLabel?.text = model.movie
        cell.detailTextLabel?.text = model.genre
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredModels.count
        }
        
        return models.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func filterRowsForSearchedText(_ searchText: String) {
        filteredModels = models.filter({( model : Model) -> Bool in
            return model.movie.lowercased().contains(searchText.lowercased())||model.genre.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

    
    
}

extension NNSearchNoResultPageController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let term = searchController.searchBar.text {
            filterRowsForSearchedText(term)
        }
    }
}


