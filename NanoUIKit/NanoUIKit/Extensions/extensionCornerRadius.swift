//
//  extensionCornerRadius.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import Foundation
import UIKit

extension UIView {
    enum Corners {
        case topLeading
        case bottomLeading
        case topTrailing
        case bottomTrailing
        
        //both edges
        case top
        case trailing
        case leading
        case bottom
        
        //all edges
        case all
    }
    
    func cornerRadius(_ corner: CGFloat = 0, forCorners corners: [Corners] = []) {
        if corner != 0 {
            self.layer.cornerRadius = corner
            
            corners.forEach({ corner in
                switch corner {
                    case .topLeading:
                        self.layer.maskedCorners = [.layerMinXMinYCorner]
                        return
                    case .bottomLeading:
                        self.layer.maskedCorners = [.layerMinXMaxYCorner]
                        return
                    case .topTrailing:
                        self.layer.maskedCorners = [.layerMaxXMinYCorner]
                        return
                    case .bottomTrailing:
                        self.layer.maskedCorners = [.layerMaxXMaxYCorner]
                        return
                    case .top:
                        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                        return
                    case .trailing:
                        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                        return
                    case .leading:
                        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                        return
                    case .bottom:
                        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                        return
                    case .all:
                        self.layer.maskedCorners = [
                            .layerMinXMinYCorner,
                            .layerMinXMaxYCorner,
                            .layerMaxXMinYCorner,
                            .layerMaxXMaxYCorner]
                        return
                }
            })
        }
    }
}
