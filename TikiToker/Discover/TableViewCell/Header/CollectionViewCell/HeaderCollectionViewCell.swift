//
//  HeaderCollectionViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(using image: UIImage) {
        self.imageView.image = image
    }
}
