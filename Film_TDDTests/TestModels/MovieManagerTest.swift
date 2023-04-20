//
//  MovieManagerTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 19/4/23.
//

import XCTest
@testable import Film_TDD

class MovieManagerTest: XCTestCase {

    //MARK: Initial values
    func test_init_moviewsToSeeReturnsZero() {

        let sut = MovieManager()
        XCTAssertEqual(sut.moviesToSee.count, 0)
    }

    func test_init_moviesSeenReturnZero() {

        let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeen.count, 0)
    }

    //MARK: Add & Query
    func test_add_moviesToSeeReturnsOne() {

        let (sut, _) = makeSUT(title: MovieName.sciFi.rawValue)
        XCTAssertEqual(sut.moviesToSee.count, 1)
    }

    func test_query_returnsMovieAtIndex() {

        let (sut, movie) = makeSUT(title: MovieName.arthouseDrama.rawValue)
        let movieQueried = sut.getMovie(at: 0)

        XCTAssertEqual(movie.title, movieQueried.title)
    }

    //MARK: Checking Off
    func test_checkOffMovie_updatesMovieManagerCount() {

        var (sut, _) = makeSUT(title: MovieName.actionAdventure.rawValue)
        sut.checkOffMovie(at: 0)

        XCTAssertEqual(sut.moviesToSee.count, 0)
        XCTAssertEqual(sut.moviesSeen.count, 1)
    }

    func test_checkOffMoview_removesMovieFromArray() {
        
        var (sut, _) = makeSUT(title: MovieName.sciFi.rawValue)
        let artHouseDrama = Movie(title: MovieName.arthouseDrama.rawValue)
        sut.add(artHouseDrama)
        sut.checkOffMovie(at: 0)

        XCTAssertEqual(sut.getMovie(at: 0).title, artHouseDrama.title)
    }

    func test_checkOffMovie_returnMovieAtIndex() {

        var (sut, movie) = makeSUT(title: MovieName.sciFi.rawValue)
        sut.checkOffMovie(at: 0)
        let movieQueried = sut.getCheckedMovie(at: 0)
        XCTAssertEqual(movie.title, movieQueried.title)
    }

    func test_clearArrays_returnArrayCountsOfZero() {
        var (sut, _) = makeSUT(title: MovieName.sciFi.rawValue)
        sut.add(Movie(title: MovieName.actionAdventure.rawValue))
        sut.checkOffMovie(at: 0)

        XCTAssertEqual(sut.moviesToSee.count, 1)
        XCTAssertEqual(sut.moviesSeen.count, 1)

        sut.resetMovies()

        XCTAssertEqual(sut.moviesToSee.count, 0)
        XCTAssertEqual(sut.moviesSeen.count, 0)
    }

    //MARK: Duplicates
    func test_duplicateMovies_shouldNotBeAddedToArray() {
        let (sut, movie) = makeSUT(title: MovieName.sciFi.rawValue)
        sut.add(movie)

        XCTAssertEqual(sut.moviesToSee.count, 1)
    }

    //MARK: Helpers
    func makeSUT(title: String =  MovieName.test.rawValue) -> (sut: MovieManager, movie: Movie){

        let sut = MovieManager()
        let movie = Movie(title: title)
        sut.add(movie)
        return (sut, movie)
    }
}

enum MovieName: String {
    case sciFi = "Sci-Fi"
    case arthouseDrama = "Arthouse Drama"
    case actionAdventure = "Action/Adventure"
    case test = "TestMovie"
    case fairyTale = "FairyTale"
    case darkComedy = "DarkComedy"
    case thriller = "Thriller"
    case indiComedy = "Indicomedy"
}
