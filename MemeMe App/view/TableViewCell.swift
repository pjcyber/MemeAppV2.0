//
//  TableViewCell.swift
//  MemeMe App
//
//  Created by Pjcyber on 3/19/20.
//  Copyright © 2020 Pjcyber. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var tableTitleLabel: UILabel!
    
    // MARK: - creating TableViewCell object
    func setTableViewCell(meme: Meme) {
        tableImageView.image = meme.memedImage
        tableTitleLabel.text = meme.topText + " " + meme.bottomText
    }
}
