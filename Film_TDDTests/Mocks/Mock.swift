//
//  Mock.swift
//  Film_TDDTests
//
//  Created by Christian Calixto on 20/4/23.
//

import Foundation
import UIKit

@testable import Film_TDD

extension MovieLibraryDatServiceTest {

    class TableViewMock: UITableView {

        var cellDequeuedProperly = false

        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "Cell")

            return mock
        }

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            self.cellDequeuedProperly = true

            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }

    }

    class MovieCellMock: MovieCell {

        var movie: Movie?

        override func configCell(with movie: Movie) {
            self.movie = movie
        }
    }
}

extension MovieCellTest {

    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }


    }
}
