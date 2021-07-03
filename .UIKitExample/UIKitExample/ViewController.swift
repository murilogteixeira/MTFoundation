//
//  ViewController.swift
//  UIKitExample
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit
import MTFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        self.view.addSubview(view)
        view.pinEdge.to(self.view)
    }

}

