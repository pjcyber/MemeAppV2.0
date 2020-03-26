//
//  CollectionViewCell.swift
//  MemeMe App
//
//  Created by Pjcyber on 3/23/20.
//  Copyright © 2020 Pjcyber. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var collectionImageView: UIImageView!
    
    // MARK: - creating CollectionViewCell object
    func setCollectionViewCell(meme: Meme) {
        collectionImageView.image = meme.memedImage
    }
}
