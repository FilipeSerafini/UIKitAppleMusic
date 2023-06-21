//
//  FavoritesViewController.swift
//  NanoUIKit
//
//  Created by Filipe Serafini on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var musics: [Music] = MusicService.singleton.getAllMusics()
    var favorites: [Music] = MusicService.singleton.favoriteMusics
//    favorites.append(musics[2])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (!musics.isEmpty) {
            tableView.dataSource = self
            tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoritesCell")
            tableView.isHidden = false
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musics[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        cell.type = .normal
        
        cell.musicName.text = music.title
        cell.groupName.text = music.artist
        cell.musicImage.image = UIImage(named: music.id)
        
        
        
        
        return cell
    }
    
}
