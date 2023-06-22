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
    
    var playlistData: MusicCollection? = MusicService.singleton.getAllCollection(withType: .playlist).randomElement()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let chosenPlaylist = playlistData{
            imageCover.image = UIImage(named: chosenPlaylist.id)
            imageCover.cornerRadius(20, forCorners: [.all])
            
            playlistTitleLabel.text = chosenPlaylist.title
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let cell = tableView.cellForRow(at: indexPath) as! AlbumDescriptionTableViewCell
            cell.albumDescriptionLabel.numberOfLines = 0
            cell.moreButton.isHidden = true
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : playlistData!.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
            
            let music = playlistData!.musics[indexPath.row]
            cell.groupName.text = music.artist
            cell.musicImage.image = UIImage(named: music.id)
            cell.musicName.text = music.title
            cell.type = .normal
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumDescriptionCell", for: indexPath) as! AlbumDescriptionTableViewCell
            
            let chosenPlaylist = playlistData!
            if let description = chosenPlaylist.albumArtistDescription {
                cell.albumDescriptionLabel.text = description
            } else if let descriptionAlbum = chosenPlaylist.albumDescription{
                cell.albumDescriptionLabel.text = descriptionAlbum
            } else {
                cell.shouldShow = false
            }
            
            return cell
        }
    }
}
