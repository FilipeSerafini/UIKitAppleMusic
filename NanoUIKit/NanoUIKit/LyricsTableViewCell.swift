//
//  LyricsTableViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import UIKit

class LyricsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lyricsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
