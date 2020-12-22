//
//  HomeFeedViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class HomeFeedViewCell: UICollectionViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var audio: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var bottomView: UIGradientView!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var miscButton: UIButton!
    @IBOutlet weak var verificationBadge: UIImageView!
    
    func configureCells(using data: Post) {
        username.text = data.username
        backgroundImage.image = data.image
        caption.text = data.caption
        audio.text = data.audio
        likes.text = data.likes
        comments.text = data.comments
        trackImage.image = data.track
        verificationBadge.isHidden = !data.verified
    }
}
