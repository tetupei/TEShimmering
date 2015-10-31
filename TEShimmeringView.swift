//
//  TEShimmeringView.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

class TEShimmeringView: UIView {
    var hasOldContentView = false

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func layerClass() -> AnyClass {
        return TEShimmeringLayer.self
    }
    
    var contentView: UIView? {
        willSet(newValue) {
            self.hasOldContentView = (self.contentView == newValue)
        }
        didSet {
            if self.hasOldContentView { return }
            self.addSubview(self.contentView!)
            let layer = self.layer as! TEShimmeringLayer
            layer.contentLayer = self.contentView?.layer
        }
    }
    
}
