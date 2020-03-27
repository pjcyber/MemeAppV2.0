//
//  MemeDetailsViewController.swift
//  MemeMe App
//
//  Created by Pjcyber on 3/25/20.
//  Copyright © 2020 Pjcyber. All rights reserved.
//

import UIKit

class MemeDetailsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Global variables
    var selectedItem: Int = -1
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        if selectedItem != -1 {
            restoreSelectedMeme()
        }
    }
    
    // to set the action for edit button
    @IBAction func editMeme(_ sender: Any) {
        performSegue(withIdentifier: "MemeEditorSegue", sender: self)
    }
    
    // func to add image of the selected Meme
    func restoreSelectedMeme() {
        if selectedItem != -1 {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            let memes =  appDelegate.memes
            let editMeme = memes[selectedItem]
            
            // to fix constrains for imageView
            imageView.image = editMeme.memedImage
            imageView.contentMode = .scaleToFill
            imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .horizontal)
            imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 249), for: .horizontal)
            imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
            imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 249), for: .vertical)
        }
    }
    
    // configuring segue and sending the selected Item index
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectedItem != -1 {
            let navigationController = segue.destination as! UINavigationController
            let memeEditorViewController = navigationController.viewControllers[0] as! MemeEditorViewController
            memeEditorViewController.editItemPosition = selectedItem
        }
    }
    
}
