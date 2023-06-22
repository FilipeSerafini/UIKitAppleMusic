//
//  LibraryCardCollectionViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import UIKit

class LibraryCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coverImage.cornerRadius(16, forCorners: [.all])
    }

    
}
