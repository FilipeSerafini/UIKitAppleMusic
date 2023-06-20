//
//  ChosenPlaylistViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class ChosenPlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageCover: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    var chosenPlaylist: MusicCollection = MusicService.singleton.getAllCollection(withType: .playlist)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCover.layer.cornerRadius = 20
        playButton.layer.cornerRadius = 5
        
        playlistTableView.dataSource = self
        playlistTableView.delegate = self
        
        playlistTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chosenPlaylist.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        
        let music = chosenPlaylist.musics[indexPath.row]
        cell.groupName.text = music.artist
        cell.musicImage.image = UIImage(named: music.id)
        cell.musicName.text = music.title
        cell.rightButton.image = UIImage(systemName: "chevron.right")!
        
        return cell
    }
}
