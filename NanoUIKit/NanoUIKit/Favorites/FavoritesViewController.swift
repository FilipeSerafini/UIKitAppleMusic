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
    
    
    var favorites: [Music] = MusicService.singleton.favoriteMusics
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[0], isFavorite: true)
        MusicService.singleton.toggleFavorite(music: MusicService.singleton.getAllMusics()[1], isFavorite: true)
        
        reloadData()
        
        if (!favorites.isEmpty) {
            tableView.dataSource = self
            tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
            tableView.isHidden = false
        }
        
        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    

    private func reloadData() {
        self.favorites = MusicService.singleton.favoriteMusics
        
        if let text = searchBar.text {
            searchBar(searchBar, textDidChange: text)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        
        if MusicService.singleton.favoriteMusics.contains(music) {
            MusicService.singleton.toggleFavorite(music: music, isFavorite: false)
        }
        else {
            MusicService.singleton.toggleFavorite(music: music, isFavorite: true)
        }
        
        self.reloadData()
        
    }
    
}

// MARK: - UIFavoriteTableViewCellDelegate
extension FavoritesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        favorites = MusicService.singleton.favoriteMusics.filter({ music in
            music.title.hasPrefix(searchText)
            
        })
        
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
