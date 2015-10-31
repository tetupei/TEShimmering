//
//  ViewController.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let shimmeringView = TEShimmeringView(frame: self.view.bounds)
        self.view.addSubview(shimmeringView)
        let loadingLabel = UILabel(frame: shimmeringView.bounds)
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.text = "TEShimmering"
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

