//
//  PlayMusicViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 22/06/23.
//

import UIKit

class PlayMusicViewController: UIViewController {

    
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    }

}
