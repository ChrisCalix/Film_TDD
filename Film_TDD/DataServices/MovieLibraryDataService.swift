//
//  MovieLibraryDataService.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import UIKit


class MovieLibraryDataService: NSObject {

    var movieManager: MovieManager?

    enum LibrarySection: Int {
        case moviesToSee, moviesSeen
    }
}

extension MovieLibraryDataService: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let librarySection = LibrarySection(rawValue: section) else { return 0 }

        switch librarySection {
        case .moviesToSee:
            return movieManager?.moviesToSee.count ?? 0
        case .moviesSeen:
            return movieManager?.moviesSeen.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MovieCell  else { return UITableViewCell()}
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        print("number of sections 2")
        return 2
    }

}

extension MovieLibraryDataService: UITableViewDelegate {

}
