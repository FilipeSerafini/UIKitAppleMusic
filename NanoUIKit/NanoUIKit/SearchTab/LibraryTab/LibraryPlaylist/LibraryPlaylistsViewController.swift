//
//  LibraryPlaylistsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController {
    //, UITableViewDelegate, UITableViewDataSource

    @IBOutlet weak var playlistsTab: UITableView!
    
    var playlistsData = MusicService.singleton.getAllCollection(withType: .playlist)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "playlistsPlaylistSegue", sender: self)
//        playlistsTab.dataSource = self
//        playlistsTab.delegate = self
    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return playlistsData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        here goes the cell logic
//    }
}
