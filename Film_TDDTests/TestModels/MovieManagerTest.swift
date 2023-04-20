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

        var (sut, _) = makeSUT(title: "Sci-Fi")
        XCTAssertEqual(sut.moviesToSee.count, 1)
    }

    func test_query_returnsMovieAtIndex() {

        var (sut, movie) = makeSUT(title: "Arthouse Drama")
        let movieQueried = sut.getMovie(at: 0)

        XCTAssertEqual(movie.title, movieQueried.title)
    }

    //MARK: Checking Off
    func test_checkOffMovie_updatesMovieManagerCount() {

        var (sut, _) = makeSUT(title: "Action/Adventure")
        sut.checkOffMovie(at: 0)

        XCTAssertEqual(sut.moviesToSee.count, 0)
        XCTAssertEqual(sut.moviesSeen.count, 1)
    }

    //MARK: Helpers
    func makeSUT(title: String = "TestMovie") -> (sut: MovieManager, movie: Movie){

        var sut = MovieManager()
        let movie = Movie(title: title)
        sut.add(movie)
        return (sut, movie)
    }
}
