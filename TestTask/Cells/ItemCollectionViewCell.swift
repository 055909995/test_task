//
//  ItemCollectionViewCell.swift
//  TestTask
//
//  Created by Vardan Sargsyan on 14.03.22.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurredView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredView.addSubview(blurEffectView)
        
    }
    
    
    
    func setData(item : Item) {
        self.itemImageView.sd_setImage(with: URL(string: item.image.the1X))
        self.itemTitleLabel.text = item.title
        
    }
    
    override var isSelected: Bool {
        didSet {
            self.contentView.layer.borderWidth = 2.0
            self.contentView.layer.borderColor = isSelected ? UIColor(named: "BorderColor")?.cgColor : UIColor.clear.cgColor
        }
    }
    
}
