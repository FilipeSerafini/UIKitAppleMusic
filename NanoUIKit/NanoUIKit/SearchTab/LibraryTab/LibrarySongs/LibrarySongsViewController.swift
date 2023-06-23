//
//  LibrarySongsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class LibrarySongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var songsTableView: UITableView!
    
    var songData: [Music] = MusicService.singleton.getAllMusics()
    
    var chosenMusic: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songsTableView.dataSource = self
        songsTableView.delegate = self
        
        songsTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMusic = songData[indexPath.row]
        performSegue(withIdentifier: "songsToMusic", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        
        cell.type = .normal
        let music = songData[indexPath.row]
        
        cell.groupName.text = music.artist
        cell.musicImage.image = UIImage(named: music.id)
        cell.musicName.text = music.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "songsToMusic" {
            
            guard let navigationController = segue.destination as? UINavigationController else { return }
            
            guard let musicPlayingViewController = navigationController.topViewController as? PlayMusicViewController else { return }
            
            guard let data = chosenMusic else { return }
            
            musicPlayingViewController.currentMusic = data
        }
    }

}
