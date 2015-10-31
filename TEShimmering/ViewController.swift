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
        let rect = CGRectMake(80, 0, 200, 50)
        self.shimmeringView = TEShimmeringView(frame: rect)
        self.view.addSubview(self.shimmeringView)
        let loadingLabel = UILabel(frame: self.shimmeringView.bounds)
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.text = "TEShimmering"
        loadingLabel.textColor = UIColor.blackColor()
        shimmeringView.contentView = loadingLabel
        
        
//        FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.view.bounds];
//        [self.view addSubview:shimmeringView];
//        
//        UILabel *loadingLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
//        loadingLabel.textAlignment = NSTextAlignmentCenter;
//        loadingLabel.text = NSLocalizedString(@"Shimmer", nil);
//        shimmeringView.contentView = loadingLabel;
//        
//        // Start shimmering.
//        shimmeringView.shimmering = YES;
    }

    @IBAction func pushedButton(sender: AnyObject) {
        let layer = self.shimmeringView?.layer as! TEShimmeringLayer
        layer.updateShimmering()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

