//
//  HomeFeedViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

protocol DoubleTapDelegate: class {
    func doubleTap(indexPath: IndexPath?)
}

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
    
    @IBOutlet weak var overview: UIView!
    
    weak var delegate: DoubleTapDelegate?
    var selectedAtIndex: IndexPath?
    
    var doubleTapGesture: UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        gesture.numberOfTapsRequired = 2
        return gesture
    }
    let heart: UIImageView = {
        let icon = UIImageView(image: #imageLiteral(resourceName: "heart-icon"))
        icon.contentMode = .scaleAspectFit
        icon.frame = CGRect(x: 0.0, y: 0.0, width: 128.0, height: 128.0)
        return icon
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @objc
    func doubleTap(_ gesture: UITapGestureRecognizer) {
        delegate?.doubleTap(indexPath: selectedAtIndex)
        print("DoubleTap")
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.heart.alpha = 1
                self.likeButton.tintColor = UIColor(named: "LikeButtonRed")
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            } completion: { (done) in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseInOut) {
                        self.heart.alpha = 0
                    } completion: { (complete) in
                        if complete {
//                            heart.removeFromSuperview()
                        }
                    }
                }
            }

        }
    }
    
    func configureCells(using data: Post) {
        username.text = data.username
        backgroundImage.image = data.image
        caption.text = data.caption
        audio.text = data.audio
        likes.text = data.likes
        comments.text = data.comments
        trackImage.image = data.track
        verificationBadge.isHidden = !data.verified
        
        overview.addGestureRecognizer(doubleTapGesture)
        heart.center = self.center
        heart.alpha = 0
        overview.addSubview(heart)
    }
}
