//
//  LibraryViewControllerTest.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 19/4/23.
//

import XCTest
@testable import Film_TDD

class LibraryViewControllerTest: XCTestCase {

    func test_libraryVC_tableViewShouldNotNil() {
        
        let sut = makeSUT()
        XCTAssertNotNil(sut.libraryTableView)
    }

    func test_viewDidLoad_setTableViewDataSource() {

        let sut = makeSUT()

        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }

    func test_viewDidLoad_setTableViewDelegate() {

        let sut = makeSUT()

        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }

    func test_viewDidLoad_singleDataServiceObject() {

        let sut = makeSUT()
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }

    //MARK: Helpers
    func makeSUT() -> LibraryViewController {

        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LibraryViewController.identifier) as! LibraryViewController
        sut.loadViewIfNeeded()
        //MARK: Also work _= sut.view
        return sut
    }

   
}
