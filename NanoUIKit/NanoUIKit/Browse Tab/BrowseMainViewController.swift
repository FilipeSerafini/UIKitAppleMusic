//
//  BrowseMainViewController.swift
//  NanoUIKit
//
//  Created by Pedro Mezacasa Muller on 21/06/23.
//

import UIKit

class BrowseMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var browseTableView: UITableView!
    
    //Dados reais
    var allData: [(type: MusicCollectionCategory, color: UIColor)] = [
        (.spatialAudio, UIColor(red: 0.91, green: 0.22, blue: 0.32, alpha: 0.8)),
        (.pop, .systemPink),
        (.metal, .systemGreen),
        (.hits, .systemYellow),
        (.brazillianPop, .systemCyan)]
    
    //Dados usados pela tableViewController e alterados aqui
    var usedData: [(type: MusicCollectionCategory, color: UIColor)] = [
        (.spatialAudio, .systemRed),
        (.pop, .systemPink),
        (.metal, .systemGreen),
        (.hits, .systemYellow),
        (.brazillianPop, .systemCyan)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        browseTableView.dataSource = self
        browseTableView.delegate = self
        browseTableView.register(UINib(nibName: "xibBigCard", bundle: .main), forCellReuseIdentifier: "BigCard")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = browseTableView.dequeueReusableCell(withIdentifier: "BigCard", for: indexPath) as! bigCardTableViewCell
        
        let data = usedData[indexPath.row]
        
        cell.blurCard.backgroundColor = data.color
        cell.imageCover.image = UIImage(named: data.type.description)
        cell.titleLabel.text = data.type.description
        
        return cell
    }

}
