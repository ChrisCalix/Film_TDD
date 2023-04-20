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

        guard let movieManager = movieManager, let librarySection = LibrarySection(rawValue: indexPath.section) else { return UITableViewCell() }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MovieCell  else { return UITableViewCell()}

        let movieData = librarySection.rawValue == 0 ? movieManager.getMovie(at: indexPath.row) : movieManager.getCheckedMovie(at: indexPath.row)

        cell.configCell(with: movieData)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        guard let librarySection = LibrarySection(rawValue: section) else { return nil }

        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        print("number of sections header \(sectionTitle)")
        return sectionTitle
    }

}

extension MovieLibraryDataService: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager, let libraeySEction = LibrarySection(rawValue: indexPath.section) else { return }

        if libraeySEction == .moviesToSee {
            movieManager.checkOffMovie(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
