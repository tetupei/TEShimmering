//
//  ViewController.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shimmeringView: TEShimmeringView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label
        let rect = CGRectMake(80, 80, 200, 50)
        self.shimmeringView = TEShimmeringView(frame: rect)
        self.view.addSubview(self.shimmeringView)
        let loadingLabel = UILabel(frame: self.shimmeringView.bounds)
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.text = "TEShimmering"
        loadingLabel.textColor = UIColor.blackColor()
        shimmeringView.contentView = loadingLabel
        shimmeringView.setShimmeringSpeed(20)
        
        //button
        let rect2 = CGRectMake(80, 300, 200, 50)
        let btnShimmeringView = TEShimmeringView(frame: rect2)
        self.view.addSubview(btnShimmeringView)
        let button = UIButton(frame: btnShimmeringView.bounds)
        button.setTitle("TEShimmering", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnShimmeringView.contentView = button
        button.addTarget(self, action: "pushedButton:", forControlEvents: UIControlEvents.TouchUpInside)
    }

    func pushedButton(sender: AnyObject) {
        print("pushedButton")
    }

}

