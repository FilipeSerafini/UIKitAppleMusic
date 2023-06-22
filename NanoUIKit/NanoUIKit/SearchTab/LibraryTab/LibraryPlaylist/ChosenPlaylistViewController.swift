//
//  ChosenPlaylistViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class ChosenPlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var albumDescriptionLabel: UILabel!
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var playlistTableView: UITableView!
    @IBOutlet weak var playlistTitleLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    var playlistData: MusicCollection? = MusicService.singleton.getAllCollection(withType: .playlist).randomElement()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let chosenPlaylist = playlistData{
            imageCover.image = UIImage(named: chosenPlaylist.id)
            imageCover.cornerRadius(20, forCorners: [.all])
            
            playlistTitleLabel.text = chosenPlaylist.title
            
            if let description = chosenPlaylist.albumArtistDescription{
                albumDescriptionLabel.text = description
            } else if let descriptionAlbum = chosenPlaylist.albumDescription{
                albumDescriptionLabel.text = descriptionAlbum
            } else {
                moreLabel.text = ""
                albumDescriptionLabel.text = ""
            }
            
        }
        
        //imageCover.cornerRadius(12, forCorners: [.all])
//        imageCover.layer.borderWidth = 1
//        imageCover.layer.borderColor = UIColor.clear
//            .cgColor
//        imageCover.layer.masksToBounds = false
        
        playButton.cornerRadius(12, forCorners: [.all])
        shuffleButton.cornerRadius(12, forCorners: [.all])
        
        playlistTableView.dataSource = self
        playlistTableView.delegate = self
        
        playlistTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playlistData!.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        
        let music = playlistData!.musics[indexPath.row]
        cell.groupName.text = music.artist
        cell.musicImage.image = UIImage(named: music.id)
        cell.musicName.text = music.title
        cell.rightButton.image = UIImage(systemName: "chevron.right")!
        
        return cell
    }
}
