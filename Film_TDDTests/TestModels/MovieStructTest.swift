//
//  MovieStructTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 19/4/23.
//

import XCTest
@testable import Film_TDD

final class MovieStructTest: XCTestCase {

    func test_init_movieWithTitle() {

        let testMovie = Movie(title: "Generic Blockbuster")

        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }

    func test_init_setMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")

        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }

    func test_equatable_returnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")

        XCTAssertEqual(actionMovie1, actionMovie2)
    }

    func test_equatable_notEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")

        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }

    func test_equatable_returnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Adventure", releaseDate: "2018")

        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
}
