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

    var movieManager = MovieManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService

        dataService.movieManager = movieManager

        dataService.movieManager?.add(Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.add(Movie(title: "Jhonny", releaseDate: "1999"))
        dataService.movieManager?.add(Movie(title: "Myje", releaseDate: "1993"))
        dataService.movieManager?.add(Movie(title: "sda", releaseDate: "200"))

        dataService.movieManager?.checkOffMovie(at: 1)

        libraryTableView.reloadData()
    }

}

