//
//  TableViewController.swift
//  MemeMe App
//
//  Created by Pjcyber on 3/19/20.
//  Copyright © 2020 Pjcyber. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Global Variables
    var memes: [Meme] = []
    var selectedItem: Int  = -1
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memes =  appDelegate.memes
        tableView.reloadData()
    }
    
    // MARK: - configuring UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        cell.setTableViewCell(meme: meme)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        performSegue(withIdentifier: "memeDetails", sender: self)
    }
    
    // to reset selectedItem when the user taps plus button
    @IBAction func addMeme(_ sender: Any) {
        selectedItem = -1
    }
    
    // configuring segue and sending the selected Item index
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectedItem != -1 {
            let memeDetailsViewController = segue.destination  as! MemeDetailsViewController
            memeDetailsViewController.selectedItem = selectedItem
        }
    }
}
