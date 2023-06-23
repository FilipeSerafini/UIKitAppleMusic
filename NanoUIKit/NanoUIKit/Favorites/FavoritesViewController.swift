//
//  FavoritesViewController.swift
//  NanoUIKit
//
//  Created by Filipe Serafini on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var favorites: [Music] = [] {
        didSet {
            tableView.isHidden = favorites.isEmpty
            tableView.reloadSections(IndexSet(integer: 0), with: oldValue != favorites ? .automatic : .none)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favorites = MusicService.singleton.favoriteMusics
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[0], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[1], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[2], isFavorite: true)
        
        favorites = MusicService.singleton.favoriteMusics
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[3], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[4], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[5], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[6], isFavorite: true)
//        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[7], isFavorite: true)
        
//        MusicService.singleton.eraseAllFavorites()
        
        if (!favorites.isEmpty) {
            tableView.dataSource = self
            tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
            tableView.isHidden = false
        }
        
        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = favorites[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        cell.type = .favorite
        
        
        cell.musicName.text = music.title
        cell.groupName.text = music.artist
        cell.musicImage.image = UIImage(named: music.id)
        cell.delegate = self
        
        return cell
    }
    
}

// MARK: - UIFavoriteTableViewCellDelegate
extension FavoritesViewController: FavoritesTavleViewCellDelegate {
    
    func favoriteButtonTapped(cell: FavoritesTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let music = favorites[indexPath.row]
        
        let isFavorite = MusicService.singleton.favoriteMusics.contains(music)
        MusicService.singleton.toggleFavorite(music: music, isFavorite: !isFavorite)
        
        favorites.remove(at: indexPath.row)
    }
    
}

// MARK: - UIFavoriteTableViewCellDelegate
extension FavoritesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            favorites = MusicService.singleton.favoriteMusics
        } else {
            favorites = MusicService.singleton.favoriteMusics.filter({ music in
                music.title.hasPrefix(searchText)
            })
        }
        
        // Criar index paths dos índices removidos do Array novo em comparação com o valor anterior
        //        let indexPaths = previousFavorites
        //                            .enumerated()
        //                            .filter{ !favorites.contains($0.element) }
        //                            .compactMap{ $0.offset }
        //                            .compactMap{ IndexPath(row: $0, section: 0) }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
