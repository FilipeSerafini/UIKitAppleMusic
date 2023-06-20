//
//  MusicXib.swift
//  NanoUIKit
//
//  Created by Filipe Serafini on 19/06/23.
//

import UIKit

class MusicXibController: UIView {
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override init(frame: CGRect) { //for using CustomView in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { //for using CustomView in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("MusicXib", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
