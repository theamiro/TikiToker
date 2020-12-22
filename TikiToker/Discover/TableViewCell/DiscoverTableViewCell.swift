//
//  DiscoverTableViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    static let identifier = "discoverTableViewCell"
    
    @IBOutlet weak var type: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var topPicks = [TopPick]()
    
    static func nib() -> UINib {
        return UINib(nibName: DiscoverTableViewCell.identifier, bundle: nil)
    }
    
    func configure(with tags: Tag) {
        switch tags.type {
            case .hashtag:
                self.type.image = UIImage(systemName: "number")?.withTintColor(.white)
            case .audio:
                self.type.image = UIImage(systemName: "music.note")?.withTintColor(.white)
        }
        self.title.text = tags.title
        self.category.text = tags.category
        self.views.text = tags.views
        self.topPicks.append(contentsOf: tags.topPicks)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "DiscoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension DiscoverTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPicks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionViewCell", for: indexPath) as? DiscoverCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(with: topPicks[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 128.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
