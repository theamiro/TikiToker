//
//  DiscoverCollectionViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {

    static let identifier = "discoverCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with tag: TopPick) {
        self.imageView.image = tag.image
    }
}
