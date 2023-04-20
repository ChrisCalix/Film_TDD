//
//  MovieCell.swift
//  Film_TDD
//
//  Created by Christian Calixto on 20/4/23.
//

import UIKit

class MovieCell: UITableViewCell {

    override class func awakeFromNib() {
        super.awakeFromNib()

    }

    func configCell(with movie: Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }
}
