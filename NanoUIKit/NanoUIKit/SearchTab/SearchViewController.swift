//
//  SearchViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var songSearch: UISearchBar!
    
    @IBOutlet weak var searchCollection: UICollectionView!
    
    //Dados reais
    var allData: [MusicCollectionCategory] = [.spatialAudio, .pop, .metal, .hits, .brazillianPop]
    //Dados usados pela tableViewController e alterados aqui
    var usedData: [MusicCollectionCategory] = [.spatialAudio, .pop, .metal, .hits, .brazillianPop]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //search Bar delegate
        songSearch.delegate = self
        
        //TABLE VIEW DELEGATE
        searchCollection.delegate = self
        searchCollection.dataSource = self
        //
        searchCollection.register(UINib(nibName: "xibBigCardSearch", bundle: .main), forCellWithReuseIdentifier: "BigCard")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //pra fechar o teclado quando apertar search
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Modificar o array usado pra tableViewController aqui
        usedData = allData.filter{ thing in
            thing.description.hasPrefix(searchText)
        }
        
        //Dar .update na tableViewController
        searchCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigCard", for: indexPath) as! BigCardSeachCell
        
        let data = usedData[indexPath.row]
        cell.imageCover.image = UIImage(named: data.description)
        cell.titleLabel.text = data.description
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // Verifique se o elemento suplementar é um cabeçalho da seção
        if kind == UICollectionView.elementKindSectionHeader {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerBrowse", for: indexPath)
            
            return headerView
        }
        
        return UICollectionReusableView()
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
        return 8
    }
       
}
