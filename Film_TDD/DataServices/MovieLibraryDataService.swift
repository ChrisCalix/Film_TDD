//
//  MovieLibraryDataService.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import UIKit

class MovieLibraryDataService: NSObject {

    var movieManager: MovieManager?
}

extension MovieLibraryDataService: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        movieManager?.moviesToSee.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        print("number of sections 2")
        return 2
    }

}

extension MovieLibraryDataService: UITableViewDelegate {

}
