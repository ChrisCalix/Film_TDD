//
//  MovieManager.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import Foundation

class MovieManager {

    var moviesToSee: [Movie]
    var moviesSeen: [Movie]

    init(moviesSeen: [Movie] = [Movie](), moviesToSee: [Movie] = [Movie]()) {

        self.moviesSeen = moviesSeen
        self.moviesToSee = moviesToSee
    }

    func add(_ movie: Movie) {

        if !moviesToSee.contains(movie) {
            moviesToSee.append(movie)
        }
    }

    func getMovie(at index: Int) -> Movie {

        return moviesToSee[index]
    }

    func checkOffMovie(at index: Int) {

        guard index < moviesToSee.count else { return }
        moviesSeen.append(moviesToSee[index])
        moviesToSee.remove(at: index)
    }

    func getCheckedMovie(at index: Int) -> Movie {

        return moviesSeen[index]
    }

    func resetMovies() {
        moviesSeen.removeAll()
        moviesToSee.removeAll()
    }
}
