//
//  LibraryCollectionTableViewCell.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import UIKit

class LibraryCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var cardCollection: UICollectionView!
    
    var data: [MusicCollection] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardCollection.dataSource = self
        cardCollection.delegate = self
        
        cardCollection.register(UINib(nibName: "LibraryCard", bundle: .main), forCellWithReuseIdentifier: "LibCard")
        
        // Disable scrolling
        cardCollection.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollection.dequeueReusableCell(withReuseIdentifier: "LibCard", for: indexPath) as! LibraryCardCollectionViewCell
        
        let playlist = data[indexPath.row]
        cell.coverImage.image = UIImage(named: playlist.id)
        cell.artistLabel.text = playlist.mainPerson
        cell.titleLabel.text = playlist.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width / 2
        let collectionViewHeigth = collectionView.bounds.height / 4
        
        return CGSize(width: collectionViewWidth, height: collectionViewHeigth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Definindo o espaçamento horizontal entre as células
        return 0
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Definindo o espaçamento vertical entre as células
        return 0
    }
    
}
