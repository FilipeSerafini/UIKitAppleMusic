//
//  RenanTableViewCell.swift
//  NanoUIKit
//
//  Created by Filipe Serafini on 19/06/23.
//

import UIKit

enum CellType {
    case favorite, normal
}

class FavoritesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var musicImage: UIImageView!
    
    var type: CellType = .normal {
        didSet {
            rightButton.imageView?.image = UIImage(systemName: type == .normal ? "chevron.right" : "heart.fill")?.withTintColor(type == .normal ? .gray : UIColor(named: "AccentColor")!)
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        musicImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
