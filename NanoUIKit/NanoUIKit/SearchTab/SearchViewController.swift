//
//  SearchViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 20/06/23.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var songSearch: UISearchBar!
    
    //Dados reais
    var allData: [String] = ["Todos", "Os", "Dados", "Aqui"]
    //Dados usados pela tableViewController e alterados aqui
    var usedData: [String] = ["Usar", "Esses", "Dados", "Aqui"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //search Bar delegate
        songSearch.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //pra fechar o teclado quando apertar search
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Modificar o array usado pra tableViewController aqui
        
        //Dar .update na tableViewController
    }

}
