//
//  PlayMusicViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import UIKit

class PlayMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
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
    
    func prepareLeaveFirstScreen(){
        ownerView.isHidden = true
    }
    
    
    //PlaylistScreen
    //owner of things under this
    @IBOutlet weak var playlistView: UIView!
    //Things that should only appear in playlistScreen
    @IBOutlet weak var playlistTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        
        playlistTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoriteCell")
    }
    
}
