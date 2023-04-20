//
//  MovieCellTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 20/4/23.
//

import XCTest
@testable import Film_TDD

class MovieCellTest: XCTestCase {

    func test_cell_configShouldSetLabelsToMovieData() {

        let (sut, _) = makeSUT()

        let cell = sut.dequeueReusableCell(withIdentifier: "Cell", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configCell(with: Movie(title: MovieName.indiComedy.rawValue, releaseDate: "2018"))

        XCTAssertEqual(cell.textLabel?.text, MovieName.indiComedy.rawValue)
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

    func makeSUT() -> (sut: UITableView, mock: MockCellDataSource){
        var tableView: UITableView = UITableView()
        let mock: MockCellDataSource = MockCellDataSource()

        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LibraryViewController.identifier) as! LibraryViewController

        _ = libraryVC.view

        tableView = libraryVC.libraryTableView
        tableView.dataSource = mock
        return (tableView, mock)
    }
}

