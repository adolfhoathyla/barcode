//
//  BarcodeScanViewController.swift
//  BarcodeDemo
//
//  Created by Cmdev on 02/07/2018.
//  Copyright © 2018 Pos Cash. All rights reserved.
//

import UIKit
import BarcodeScanner

class BarcodeScanViewController: UIViewController {

    let barcodeViewController = BarcodeScannerViewController()
    
    var didReadCode: ((_ code: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBarcode()
        presentBarcode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - aux methods
    private func presentBarcode() {
        self.view.addSubview(barcodeViewController.view)
        self.addChildViewController(barcodeViewController)
        barcodeViewController.didMove(toParentViewController: self)
    }
    
    private func configBarcode() {
        barcodeViewController.codeDelegate = self
        barcodeViewController.errorDelegate = self
        
        barcodeViewController.cameraViewController.barCodeFocusViewType = .oneDimension
        barcodeViewController.view.backgroundColor = UIColor.white
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BarcodeScanViewController: BarcodeScannerCodeDelegate {
    public func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        if let didReadCode = self.didReadCode {
            didReadCode(code)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
            controller.reset(animated: true)
        })
    }
}


extension BarcodeScanViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}
