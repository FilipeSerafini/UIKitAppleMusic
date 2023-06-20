//
//  ChosenPlaylistViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class ChosenPlaylistViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    var chosenPlaylist: MusicCollection = MusicCollection(id: "", title: "", mainPerson: "", referenceDate: Date(), musics: [], type: .playlist, albumDescription: nil, albumArtistDescription: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.layer.cornerRadius = 5
    }
    
}
