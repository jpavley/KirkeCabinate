//
//  DrugCollectionViewController.swift
//  KirkeCabinate
//
//  Created by John Pavley on 6/30/18.
//  Copyright © 2018 John Pavley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DrugCell"
private let numberOfSectionsInView = 1

class DrugCollectionViewController: UICollectionViewController {
    
    let DrugData = Drug.loadDrugs()
    
    let columns: CGFloat = 2.0
    let inset: CGFloat = 8.0
    let spacing: CGFloat = 2.0
    let lineSpacing: CGFloat = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // https://stackoverflow.com/questions/32166364/could-not-cast-value-of-type-uicollectionviewcell
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
}

extension DrugCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSectionsInView
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return DrugData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let drugCell = cell as! DrugCollectionViewCell
    
        // Configure the cell
        let drug = DrugData[indexPath.item]
        drugCell.pillLabel.text = "\(drug)"
        let pillStates: [Pill.PillState] = [.taken, .missed, .ready]
        drugCell.pillView.state = pillStates.randomElement()!
    
        return drugCell
    }
}

extension DrugCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int((collectionView.frame.width / columns) - (inset + spacing))
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
}

