//
//  LibraryViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 19/06/23.
//

import UIKit


//IMPORTANTE: Ainda falta o delegate da selecao dentro da collection, que n vou fazer ainda p n ficar maluco.
class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DelegatePlaylistCollection {
    
    var playlistToCollection: MusicCollection? = nil
    
    //Referente ao delegate do PlaylistCollection
    func performDelegate(playlist: MusicCollection) {
        playlistToCollection = playlist
        performSegue(withIdentifier: "MainPlaylistSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainPlaylistSegue"{
            let destination = segue.destination as! ChosenPlaylistViewController
            destination.playlistData = playlistToCollection
        }
    }
    
    var data: (category: [MusicCollectionType],header: String, playlist: [MusicCollection])  = ([.playlist, .artists, .album, .songs],"Header aqui", MusicService.singleton.loadLibrary())
    
    @IBOutlet weak var libTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libTableView.dataSource = self
        libTableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? data.category.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //retrieve cell
        if indexPath.section == 0{
            let cell = libTableView.dequeueReusableCell(withIdentifier: "LibraryCategoryCell", for: indexPath) as! LibraryTableViewCell
            
            //configure
            cell.category = data.category[indexPath.row]
            cell.categoryLabel.text = cell.category.description
            cell.mainIcon.image = UIImage(systemName: cell.category.icon)
            
            
            
            //return cell
            return cell
        } else if indexPath.section == 2 {
            let cell = libTableView.dequeueReusableCell(withIdentifier: "LibraryCollectionCell", for: indexPath) as! LibraryCollectionTableViewCell
            
            //configure
            cell.data = data.playlist
            
            //set delegate
            cell.delegate = self
            
            //remove o divider
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            
            //return cell
            return cell
        } else {
            let cell = libTableView.dequeueReusableCell(withIdentifier: "LibraryHeader", for: indexPath) as! LibraryHeaderTableViewCell
            
            //remove o divider
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            
            //return cell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Calculate and return the desired height for the cell at the given index path
        let height: CGFloat = indexPath.section <= 1 ? tableView.bounds.height/10 : tableView.bounds.height * 1.5
        return height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            switch data.category[indexPath.row]{
            case .playlist:
                performSegue(withIdentifier: "libraryPlaylistSegue", sender: self)
            case .artists:
                performSegue(withIdentifier: "libraryArtistsSegue", sender: self)
            case .songs:
                performSegue(withIdentifier: "librarySongsSegue", sender: self)
            case .album:
                performSegue(withIdentifier: "libraryAlbumsSegue", sender: self)
            }
        }
    }
}
