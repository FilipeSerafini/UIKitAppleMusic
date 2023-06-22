//
//  AlbumDescriptionTableViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import UIKit

class AlbumDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var albumDescriptionLabel: UILabel!
    
    var shouldShow: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        self.isHidden = !shouldShow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
