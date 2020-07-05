//
//  ViewController.swift
//  WordBattle
//
//  Created by 佐々木徳哉 on 2020/06/01.
//  Copyright © 2020 佐々木徳哉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oflineBattleButton: UIButton!
    
    
    //ボタンの枠線
 
    
    //button.layer.borderColor = UIColor.red.cgColor /
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oflineBattleButton.layer.borderColor = UIColor.black.cgColor
        oflineBattleButton.layer.borderWidth = 3
    }
    
    @IBAction func restart(_ segue: UIStoryboardSegue) {
        //
    }


}

