//
//  MovieLibraryDatServiceTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 20/4/23.
//

import XCTest
@testable import Film_TDD

class MovieLibraryDatServiceTest: XCTestCase {

    func test_tableViewSection_countRturnTwo() {

        let (sut, tableView) = makeSUT()
        tableView.dataSource = sut
        tableView.delegate = sut
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }

    func test_tableViewSections_setionOneReturnsMovieToSeeCount() {

        let (sut, tableView) = makeSUT()
        tableView.dataSource = sut
        tableView.delegate = sut

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)

        let thriller = createMovie(title: MovieName.thriller.rawValue)
        sut.movieManager?.add(thriller)
        tableView.reloadData()

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }

    func test_tableViewSection() {
        let (sut, tableView) = makeSUT()
        tableView.dataSource = sut
        tableView.delegate = sut
        sut.movieManager?.checkOffMovie(at: 0)

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

        sut.movieManager?.checkOffMovie(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }

    // MARK: Helpers
    func makeSUT() -> (sut: MovieLibraryDataService, tableView:  UITableView ){

        let sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        let tableView = UITableView()

        let fairyTale = createMovie(title: MovieName.fairyTale.rawValue)
        let darkComedy = createMovie(title: MovieName.darkComedy.rawValue)

        sut.movieManager?.add(fairyTale)
        sut.movieManager?.add(darkComedy)

        return (sut, tableView)
    }

    func createMovie(title: String =  MovieName.test.rawValue) -> Movie {

        let movie = Movie(title: title)
        return movie
    }
}
