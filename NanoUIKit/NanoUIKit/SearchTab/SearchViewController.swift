//
//  SearchViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var songSearch: UISearchBar!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    //Dados reais
    var allData: [MusicCollectionCategory] = [.spatialAudio, .pop, .metal, .hits, .brazillianPop]
    //Dados usados pela tableViewController e alterados aqui
    var usedData: [MusicCollectionCategory] = [.spatialAudio, .pop, .metal, .hits, .brazillianPop]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //search Bar delegate
        songSearch.delegate = self
        
        //TABLE VIEW DELEGATE
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchTableView.register(UINib(nibName: "xibBigCard", bundle: .main), forCellReuseIdentifier: "BigCard")
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
        searchTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BigCard", for: indexPath) as! bigCardTableViewCell
        
        let data = usedData[indexPath.row]
        cell.imageCover.image = UIImage(named: data.description)
        cell.titleLabel.text = data.description
        
        return cell
    }

}
