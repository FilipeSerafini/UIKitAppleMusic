//
//  DelegatePlaylistCollection.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import Foundation
import UIKit

protocol DelegatePlaylistCollection: AnyObject {
    func performDelegate(playlist: MusicCollection)
}
