//
//  ViewController.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "collectionCell"
    var feed: [Post] = [
        Post(username: "@theamiro", image: #imageLiteral(resourceName: "starrynight"), caption: "This is the Tiktok/Reels UI for the culture", audio: "Original audio ・ theamiro", likes: "246.5K", comments: "389K", verified: true, track: #imageLiteral(resourceName: "album-art")),
        Post(username: "@wangooose", image: #imageLiteral(resourceName: "flatiron"), caption: "This is the Tiktok/Reels UI for the culture", audio: "Original audio ・ wangooose", likes: "26K", comments: "0", verified: false, track: #imageLiteral(resourceName: "album-art-white")),
        Post(username: "@philanthropy", image: #imageLiteral(resourceName: "lookup"), caption: "This is the Tiktok/Reels UI for the culture", audio: "Original audio ・ philanthropy", likes: "2K", comments: "94", verified: true, track: #imageLiteral(resourceName: "tokyo")),
        Post(username: "@safaricom", image: #imageLiteral(resourceName: "waterdrops"), caption: "This is the Tiktok/Reels UI for the culture", audio: "Original audio ・ safaricom", likes: "1M", comments: "3000", verified: true, track: #imageLiteral(resourceName: "album-art")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    private func configureNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeFeedViewCell else { return UICollectionViewCell() }
        cell.configureCells(using: feed[indexPath.row])
        return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
