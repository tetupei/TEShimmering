//
//  TEShimmeringMaskLayer.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit
import QuartzCore

class TEShimmeringMaskLayer: CAGradientLayer {
    var fadeLayer: CALayer!
    
    override init() {
        super.init()
        self.fadeLayer = CALayer()
        self.fadeLayer.backgroundColor = UIColor.whiteColor().CGColor
        self.addSublayer(self.fadeLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
override func layoutSublayers() {
        super.layoutSublayers()
        let rect = self.bounds
        self.fadeLayer.bounds = rect
        self.fadeLayer.position = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
    }
}
