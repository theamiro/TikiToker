//
//  DiscoverViewController.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

enum TagType {
    case hashtag
    case audio
}
struct Tag {
    var type: TagType
    var title: String
    var category: String
    var views: String
    var topPicks: [TopPick]
    var image: UIImage
}
struct TopPick {
    var image: UIImage
}
class DiscoverViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var headerImages: [UIImage] = [
        #imageLiteral(resourceName: "honda-crf"),
        #imageLiteral(resourceName: "flatiron"),
        #imageLiteral(resourceName: "album-art"),
        #imageLiteral(resourceName: "waterdrops"),
        #imageLiteral(resourceName: "lookup")
    ]
    let feed: [Tag] = [
        Tag(type: .audio, title: "Makes no sense", category: "Trending", views: "34.0M", topPicks: [TopPick(image: #imageLiteral(resourceName: "starrynight")),TopPick(image:#imageLiteral(resourceName: "honda-crf")), TopPick(image:#imageLiteral(resourceName: "flatiron")), TopPick(image:#imageLiteral(resourceName: "tokyo"))], image: #imageLiteral(resourceName: "honda-crf")),
        Tag(type: .hashtag, title: "YearOnTikitoker", category: "Trending Song", views: "4M", topPicks: [TopPick(image: #imageLiteral(resourceName: "waterdrops")), TopPick(image:#imageLiteral(resourceName: "tokyo")), TopPick(image:#imageLiteral(resourceName: "husqvarna"))], image: #imageLiteral(resourceName: "album-art")),
        Tag(type: .hashtag, title: "Mask off", category: "Trending", views: "234K", topPicks: [TopPick(image:#imageLiteral(resourceName: "waterdrops")), TopPick(image: #imageLiteral(resourceName: "boat")), TopPick(image:#imageLiteral(resourceName: "starrynight"))], image: #imageLiteral(resourceName: "waterdrops")),
        Tag(type: .audio, title: "Miley", category: "Trending", views: "239K", topPicks: [TopPick(image:#imageLiteral(resourceName: "lookup")), TopPick(image: #imageLiteral(resourceName: "honda-crf")),TopPick(image:#imageLiteral(resourceName: "waterdrops")), TopPick(image:#imageLiteral(resourceName: "husqvarna")), TopPick(image:#imageLiteral(resourceName: "flatiron"))], image: #imageLiteral(resourceName: "tokyo")),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscoverTableViewCell")
        tableView.register(UINib(nibName: "DiscoverHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscoverHeaderTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self 
    }
}
extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverTableViewCell") as? DiscoverTableViewCell else { return UITableViewCell() }
        cell.configure(with: feed[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "DiscoverHeaderTableViewCell") as? DiscoverHeaderTableViewCell
        header!.configure(using: headerImages)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200.0
    }
}
