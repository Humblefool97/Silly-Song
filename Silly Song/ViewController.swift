//
//  ViewController.swift
//  Silly Song
//
//  Created by Rajeev Kr on 29/03/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        nameField.autocorrectionType = .no
    }

    @IBAction func handleReset(_ sender: UITextField) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func handleLyricsDisplay(_ sender: UITextField) {
        let name = nameField.text
        if (name != nil) && name != ""{
            let sillyLyrics = LyricsUtils.lyricsForName(fullName: name!)
            if(sillyLyrics != ""){
                lyricsView.text = sillyLyrics
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

