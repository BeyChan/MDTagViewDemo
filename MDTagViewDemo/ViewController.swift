//
//  ViewController.swift
//  MDTagViewDemo
//
//  Created by  MarvinChan on 2019/4/24.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        let str = "WOMENS FLEX HIGH WAISTED LEGGINGS "
        let www = MDTagView.getWidth(str)
        let tagV = MDTagView(frame: CGRect(x: 100, y: 200, width: www, height: 26))
        tagV.tagString = str
        self.view.addSubview(tagV)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

