//
//  ViewController.swift
//  Silly Song
//
//  Created by Rajeev Kr on 29/03/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var mNameField: UITextField!
    @IBOutlet weak var mLyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mNameField.delegate = self
        mNameField.autocorrectionType = .no
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleReset(_ sender: UITextField) {
        mNameField.text = ""
        mLyricsView.text = ""
    }

    @IBAction func handleLyricsDisplay(_ sender: UITextField) {
        let name = mNameField.text
        if (name != nil) && name != ""{
            let sillyLyrics = LyricsUtils.lyricsForName(fullName: name!)
            if(sillyLyrics != ""){
                mLyricsView.text = sillyLyrics
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

