//
//  CollectionViewController.swift
//  MemeMe App
//
//  Created by Pjcyber on 3/23/20.
//  Copyright © 2020 Pjcyber. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Global variables
    var memes: [Meme] = []
    var selectedItem: Int  = -1
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memes =  appDelegate.memes
        collectionView.reloadData()
    }
    
    // MARK: - configuring UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme = memes[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath ) as! CollectionViewCell
        cell.setCollectionViewCell(meme: meme)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCell(_:))))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    // MARK: - func to call the segue after tap the cell
    @objc func tapCell(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        if let index = indexPath {
            selectedItem = index.row
            performSegue(withIdentifier: "memeDetails", sender: self)
        }
    }
    
    // MARK: - configuring segue and sending the selected Item index
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectedItem != -1 {
            let memeDetailsViewController = segue.destination  as! MemeDetailsViewController
            memeDetailsViewController.selectedItem = selectedItem
        }
    }
}
