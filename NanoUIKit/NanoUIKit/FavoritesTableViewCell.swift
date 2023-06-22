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

protocol FavoritesTavleViewCellDelegate {
    func favoriteButtonTapped(cell: FavoritesTableViewCell)
}

class FavoritesTableViewCell: UITableViewCell {
    
    var delegate: FavoritesTavleViewCellDelegate?
    
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var musicImage: UIImageView!
    
    var type: CellType = .normal {
        didSet {
            rightButton.setImage(UIImage(systemName: type == .normal ? "chevron.right" : "heart.fill"), for: .normal)
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
    
    @IBAction func buttonAction(_ sender: Any) {
        delegate?.favoriteButtonTapped(cell: self)
    }
    
}
