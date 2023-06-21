//
//  LibraryArtistsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class LibraryArtistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var artistsTableView: UITableView!
    
    var artistsData = MusicService.singleton.loadLibrary()
    
    //Quando seleciona uma collection, muda essa propriedade e manda ela pela segue
    var artistsToSend: MusicCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        
        artistsTableView.register(UINib(nibName: "xibBigCard", bundle: .main), forCellReuseIdentifier: "BigCard")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artistsTableView.dequeueReusableCell(withIdentifier: "BigCard", for: indexPath) as! bigCardTableViewCell
            
        let artist = artistsData[indexPath.row]
        cell.imageCover.image = UIImage(named: artist.id)
        cell.titleLabel.text = artist.title
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        artistsToSend = artistsData[indexPath.row]
        performSegue(withIdentifier: "artistsPlaylistSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artistsPlaylistSegue"{
            let destination = segue.destination as! ChosenPlaylistViewController
            
            destination.playlistData = artistsToSend
        }
    }
}
