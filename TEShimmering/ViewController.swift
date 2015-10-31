//
//  ViewController.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var btnShimmeringView: TEShimmeringView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label
        let rect = CGRectMake(80, 80, 200, 50)
        let shimmeringView = TEShimmeringView(frame: rect)
        self.view.addSubview(shimmeringView)
        let loadingLabel = UILabel(frame: shimmeringView.bounds)
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.text = "TEShimmering"
        loadingLabel.textColor = UIColor.blackColor()
        shimmeringView.contentView = loadingLabel
        
        //button
        let rect2 = CGRectMake(80, 300, 200, 50)
        self.btnShimmeringView = TEShimmeringView(frame: rect2)
        self.view.addSubview(self.btnShimmeringView)
        let button = UIButton(frame: self.btnShimmeringView.bounds)
        button.setTitle("TEShimmering", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnShimmeringView.contentView = button
        button.addTarget(self, action: "pushedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        btnShimmeringView.setShimmeringSpeed(0)
        
        //slider
        self.slider.maximumValue = 300
        self.slider.minimumValue = 0
        self.slider.addTarget(self, action: "onChangeValueMySlider:", forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    internal func onChangeValueMySlider(sender : UISlider){
        self.btnShimmeringView.setShimmeringSpeed(CGFloat(sender.value))
    }
    


    func pushedButton(sender: AnyObject) {
        print("pushedButton")
    }

}

