//
//  ViewController.swift
//  youtube-app
//
//  Created by Ismatulla Mansurov on 1/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

