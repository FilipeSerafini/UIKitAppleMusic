//
//  BigCardSearchCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import Foundation
import UIKit

class BigCardSeachCell: UICollectionViewCell{
    
    @IBOutlet weak var imageCover: UIImageView!
    
    @IBOutlet weak var blurCard: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCover.cornerRadius(16, forCorners: [.all])
        blurCard.cornerRadius(16, forCorners: [.all])
    }

    
}
