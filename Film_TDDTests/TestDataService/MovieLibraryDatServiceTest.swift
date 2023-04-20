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

    func test_cell_showlDequeueCell() {
        let mock = TableViewMock()
        let sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()

        mock.dataSource = sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "Cell")

        let thriller = createMovie(title: MovieName.thriller.rawValue)
        sut.movieManager?.add(thriller)
        mock.reloadData()

        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mock.cellDequeuedProperly)
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

extension MovieLibraryDatServiceTest {

    class TableViewMock: UITableView {

        var cellDequeuedProperly = false

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            self.cellDequeuedProperly = true

            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }

    }
}
