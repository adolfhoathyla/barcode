//
//  ViewController.swift
//  BarcodeDemo
//
//  Created by Cmdev on 28/06/2018.
//  Copyright © 2018 Pos Cash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "BARCODE_SCANNER_IDENTIFIER":
            let scannerVC = segue.destination as? BarcodeScanViewController
            scannerVC?.didReadCode = { (code) in
                self.codeLabel.text = code
            }
        default:
            break
        }
    }
}


