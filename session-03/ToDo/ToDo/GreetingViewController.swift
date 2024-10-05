//
//  GreetingViewController.swift
//  ToDo
//
//  Created by user259661 on 9/20/24.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak private var greetingLabel: UILabel!
    
    var greeting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let greeting = greeting else { return }
        greetingLabel.text = greeting
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
