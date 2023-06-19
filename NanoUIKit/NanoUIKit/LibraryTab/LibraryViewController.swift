//
//  LibraryViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [MusicCollectionType] = [.playlist, .artists, .songs]
    
    @IBOutlet weak var libTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libTableView.dataSource = self
        libTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //retrieve cell
        let cell = libTableView.dequeueReusableCell(withIdentifier: "LibraryCategoryCell", for: indexPath) as! LibraryTableViewCell
        
        //configure
        cell.category = data[indexPath.row]
        cell.categoryLabel.text = cell.category.description
        cell.mainIcon.image = UIImage(systemName: cell.category.icon)
        
        //return cell
        return cell
    }
    
}
