//
//  LibraryTableViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 19/06/23.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    var category: MusicCollectionType = .playlist
    
    @IBOutlet weak var mainIcon: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state    
    }

}
