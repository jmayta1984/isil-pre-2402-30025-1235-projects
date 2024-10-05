//
//  ViewController.swift
//  Greetings
//
//  Created by user259661 on 9/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func sayHi(_ sender: UIButton) {
        greetingLabel.text = "Hi \(nameTextField.text ?? "ISIL")"
    }
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

