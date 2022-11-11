//
//  ViewController.swift
//  SliderApp
//
//  Created by Sun on 16/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func openTutorialAction(_ sender: Any) {
        let viewModel = AllowNotificationTutorialViewModel()
        viewModel.showTutorial()
    }
}
