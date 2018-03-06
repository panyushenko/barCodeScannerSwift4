//
//  ViewController.swift
//  barCodeScannerSwift4Demo
//
//  Created by Panyushenko on 06.03.2018.
//  Copyright © 2018 Artyom Panyushenko. All rights reserved.
//

import UIKit
import BarcodeScanner

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func scanAction(_ sender: Any) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        
        present(viewController, animated: true, completion: nil)
    }

}

extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        controller.dismiss(animated: true, completion: nil)
        guard let url = URL(string: "http://ean13.info/\(code).htm") else
            { return }
        webView.loadRequest(URLRequest(url: url))
    }
}

