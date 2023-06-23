//
//  PlayMusicViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import UIKit

enum State{
    case main, playlist, lyrics
}

class PlayMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentState: State = .main
    
    var fullPlaylist: MusicCollection = MusicService.singleton.loadLibrary().randomElement()!
    var currentMusic: Music?
    
    //FirstScreen
    //owner of things under this
    @IBOutlet weak var ownerView: UIView!
    //Things that sould only appear on first screen
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var progressViewUpper: UIProgressView!
    @IBOutlet weak var tillEndLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteButton.setImage(UIImage(systemName:MusicService.singleton.favoriteMusics.contains(currentMusic!) ? "heart.fill" : "heart"), for: .normal)
    }
    
    @IBAction func favortieButtonTapped(_ sender: Any) {
        
        let isFavorite = MusicService.singleton.favoriteMusics.contains(currentMusic!)
        MusicService.singleton.toggleFavorite(music: currentMusic!, isFavorite: !isFavorite)
        favoriteButton.setImage(UIImage(systemName:MusicService.singleton.favoriteMusics.contains(currentMusic!) ? "heart.fill" : "heart"), for: .normal)
    }
    
    
    func prepareLeaveFirstScreen(){
        ownerView.isHidden = true
    }
    
    func goToFirstScren(){
        ownerView.isHidden = false
    }
    
    
    //PlaylistScreen
    //owner of things under this
    @IBOutlet weak var playlistView: UIView!
    //Things that should only appear in playlistScreen
    @IBOutlet weak var playlistTableView: UITableView!
    
    func prepareLeaveSecondScreen() {
        playlistView.isHidden = true
    }
    
    func goToPlaylistScreen(){
        playlistView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLeaveSecondScreen()
        
        if currentMusic == nil{
            currentMusic = fullPlaylist.musics[0]
        }

        imageCover.cornerRadius(12, forCorners: [.all])
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        // Defina os pontos de parada com diferentes valores de opacidade
        gradientLayer.colors = [
        UIColor.black.withAlphaComponent(0.4).cgColor, // Opacidade 0.0 no início
        UIColor.black.withAlphaComponent(0.0).cgColor, // Opacidade 0.5 no meio
        UIColor.black.withAlphaComponent(0.4).cgColor  // Opacidade 1.0 no final
        ]

        // Defina os pontos de parada correspondentes aos valores de opacidade
        gradientLayer.locations = [0.0, 0.5, 1.0]

        // Adicione o gradiente à camada da view
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        imageCover.image = UIImage(named: currentMusic!.id)
        titleLabel.text = currentMusic!.title
        artistLabel.text = currentMusic!.artist
        
    
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        
        playlistTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoriteCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if currentState == .playlist{
            return 3
        } else if currentState == .lyrics{
            return 2
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentState == .playlist{
            return section == 2 ? fullPlaylist.musics.count - 1 : 1
        } else if currentState == .lyrics{
            return section == 0 ? 1 : 3
        }
        return section == 2 ? fullPlaylist.musics.count - 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentState == .playlist || currentState == .main{
            switch indexPath.section{
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
                cell.type = .favorite
                
                let music = currentMusic!
                cell.musicImage.image = UIImage(named: music.id)
                cell.groupName.text = music.artist
                cell.musicName.text = music.title
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
                
                cell.type = .lyricsCell
                
                let music = fullPlaylist.musics[indexPath.row + 1]
                cell.musicImage.image = UIImage(named: music.id)
                cell.groupName.text = music.artist
                cell.musicName.text = music.title
                return cell
            }
            
        } else {
            if indexPath.section == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
                cell.type = .favorite
                
                let music = currentMusic!
                cell.musicImage.image = UIImage(named: music.id)
                cell.groupName.text = music.artist
                cell.musicName.text = music.title
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LyricsCell", for: indexPath) as! LyricsTableViewCell
                
                let text = lyrics[indexPath.row]
                let opacity = 1 / Double(indexPath.row+1)
                
                cell.lyricsLabel.text = text
                cell.lyricsLabel.layer.opacity = Float(opacity)
                
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                
                return cell
            }
        }
    }
    
    var lyrics: [String] = [
        "Renan Trévia, muito obrigado por tudo.",
        "Você foi nosso mentor na jornada",
        "do herói. Nos sentimos no lowpoint"
    ]
    
    
    @IBOutlet weak var playlistButton: UIButton!
    
    @IBAction func playlistToggle(_ sender: Any) {
        
        if currentState == .playlist{
            prepareLeaveSecondScreen()
            goToFirstScren()
            currentState = .main
            playlistButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        } else {
            prepareLeaveFirstScreen()
            goToPlaylistScreen()
            currentState = .playlist
            playlistTableView.reloadData()
            playlistButton.setImage(UIImage(named: "list"), for: .normal)
            lyricsButton.setImage(UIImage(systemName: "quote.bubble"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var lyricsButton: UIButton!
    
    @IBAction func lyricsToggle(_ sender: Any) {
        if currentState == .lyrics {
            prepareLeaveSecondScreen()
            goToFirstScren()
            currentState = .main
            lyricsButton.setImage(UIImage(systemName: "quote.bubble"), for: .normal)
            playlistButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        } else {
            prepareLeaveFirstScreen()
            goToPlaylistScreen()
            currentState = .lyrics
            playlistTableView.reloadData()
            lyricsButton.setImage(UIImage(named: "quote"), for: .normal)
            playlistButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        }
    }
    
}
