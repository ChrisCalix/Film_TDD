//
//  LibraryViewController.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet weak var dataService: MovieLibraryDataService!
    
    static let identifier = String(describing: LibraryViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }


}

