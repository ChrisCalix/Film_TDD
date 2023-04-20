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

    func test_cell_rowAtIndexReturnsMovieCell() {
        var (sut, tableView) = makeSUT()

        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LibraryViewController.identifier) as! LibraryViewController
        _ = libraryVC.view

        tableView = libraryVC.libraryTableView
        tableView.dataSource = sut
        tableView.delegate = sut
        tableView.reloadData()

        let cellQueried = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cellQueried is MovieCell)
    }

    func test_cell_shouldDequeueCell() {

        let (sut, mock) = makeMockSUT()

        let thriller = createMovie(title: MovieName.thriller.rawValue)
        sut.movieManager?.add(thriller)
        mock.reloadData()

        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mock.cellDequeuedProperly)
    }

    func test_cell_sectionOnConfigShouldSetCellData() {
        let (sut, mock) = makeMockSUT()

        let fairyTail = createMovie(title: MovieName.fairyTale.rawValue)
        sut.movieManager?.add(fairyTail)
        mock.reloadData()

        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock

        XCTAssertEqual(cell.movie, fairyTail)
    }

    func test_cell_sectionTwoConfigShouldSetCellData() {

        let (sut, mock) = makeMockSUT()
        let darkComedy = createMovie(title: MovieName.darkComedy.rawValue)
        sut.movieManager?.add(darkComedy)
        
        sut.movieManager?.add(createMovie(title: MovieName.fairyTale.rawValue))
        sut.movieManager?.checkOffMovie(at: 0)
        mock.reloadData()

        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock

        XCTAssertEqual(cell.movie, darkComedy)
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

    func makeMockSUT() -> (sut: MovieLibraryDataService, mockTableView: TableViewMock) {
        let sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        let tableViewMock = TableViewMock.initMock(dataSource: sut)

        return (sut, tableViewMock)
    }
}
