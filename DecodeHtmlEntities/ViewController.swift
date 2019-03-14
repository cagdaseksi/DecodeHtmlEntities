//
//  ViewController.swift
//  DecodeHtmlEntities
//
//  Created by MAC on 14.03.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnDecode(_ sender: Any) {
        
        
        let myString = myTextView.text
        
        let decodeString = String(htmlEncodedString: myString!)
        
        print(decodeString)
        
    }
    
}

//extension method
extension String {
    
    init?(htmlEncodedString: String) {
        
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
    }
    
}
