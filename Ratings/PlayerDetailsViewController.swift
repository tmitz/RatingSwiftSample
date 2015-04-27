//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Tomohiro Mitsumune on 2015/04/27.
//  Copyright (c) 2015年 tmitsumune. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBAction func selectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController, selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
    }
    
    var player: Player!
    var game: String = "Chess"
    
    // MARK: - Constructor
    required init!(coder aDecoder: NSCoder!) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: game, rating: 1)
        }
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
}
