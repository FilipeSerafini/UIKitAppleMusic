//
//  LibraryHeaderTableViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import UIKit

class LibraryHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerButton.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
