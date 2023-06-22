//
//  LibraryAlbumsViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import UIKit

class LibraryAlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var albumsData: [MusicCollection] = MusicService.singleton.loadLibrary()
    
    //Quando seleciona uma collection, muda essa propriedade e manda ela pela segue
    var albumToSend: MusicCollection?
    
    @IBOutlet weak var albumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albumTableView.dataSource = self
        albumTableView.delegate = self
        
        albumTableView.register(UINib(nibName: "xibBigCard", bundle: .main), forCellReuseIdentifier: "BigCard")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albumsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "BigCard", for: indexPath) as! bigCardTableViewCell
        
        let album = albumsData[indexPath.row]
        
        cell.imageCover.image = UIImage(named: album.id)
        cell.titleLabel.text = album.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumToSend = albumsData[indexPath.row]
        performSegue(withIdentifier: "albumsPlaylistSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "albumsPlaylistSegue"{
            let destination = segue.destination as! ChosenPlaylistViewController
            destination.playlistData = albumToSend
        }
    }
}
