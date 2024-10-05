//
//  ViewController.swift
//  ToDo
//
//  Created by user259661 on 9/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? GreetingViewController else {
            return
        }
        viewController.greeting = nameTextField.text
    }


}

