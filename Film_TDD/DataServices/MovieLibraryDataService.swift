//
//  MovieLibraryDataService.swift
//  Film_TDD
//
//  Created by Christian Calixto on 19/4/23.
//

import UIKit

class MovieLibraryDataService: NSObject { }

extension MovieLibraryDataService: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }


}

extension MovieLibraryDataService: UITableViewDelegate {

}
