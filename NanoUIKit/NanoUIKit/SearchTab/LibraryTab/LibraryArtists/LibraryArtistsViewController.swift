//
//  LibraryArtistsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class LibraryArtistsViewController: UIViewController {
    //, UITableViewDelegate, UITableViewDataSource
    
    
    @IBOutlet weak var artistsTableView: UITableView!
    
    var playlistsData = MusicService.singleton.getAllCollection(withType: .artists)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        artistsTableView.delegate = self
//        artistsTableView.dataSource = self
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
