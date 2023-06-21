//
//  LibraryPlaylistsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var playlistsTab: UITableView!
    
    var playlistsData: [MusicCollection] = MusicService.singleton.loadLibrary()
    
    //Quando seleciona uma collection, muda essa propriedade e manda ela pela segue
    var playListToSend: MusicCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistsTab.dataSource = self
        playlistsTab.delegate = self
        
        playlistsTab.register(UINib(nibName: "xibBigCard", bundle: .main), forCellReuseIdentifier: "BigCard")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlistsTab.dequeueReusableCell(withIdentifier: "BigCard", for: indexPath) as! bigCardTableViewCell
        
        
        let playlist = playlistsData[indexPath.row]
        cell.imageCover.image = UIImage(named: playlist.id)
        cell.titleLabel.text = playlist.mainPerson
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playListToSend = playlistsData[indexPath.row]
        performSegue(withIdentifier: "playlistsPlaylistSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistsPlaylistSegue"{
            let destination = segue.destination as! ChosenPlaylistViewController
            
            destination.playlistData = playListToSend
            
        }
    }
}
