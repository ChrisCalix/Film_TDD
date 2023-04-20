//
//  MovieManagerTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 19/4/23.
//

import XCTest
@testable import Film_TDD

class MovieManagerTest: XCTestCase {

    func test_init_moviewsToSeeReturnsZero() {

        let sut = MovieManager()
        XCTAssertEqual(sut.moviesToSee, 0)
    }

    func test_init_moviesSeenReturnZero() {

        let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
}
