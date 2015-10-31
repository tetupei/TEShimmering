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
        didSet(newValue) {
            guard let tmpNewValue = newValue else { return }
            if self.hasOldContentView { return }
            self.addSubview(tmpNewValue)
            let layer = self.layer as! TEShimmeringLayer
            layer.contentLayer = tmpNewValue.layer
        }
    }
    
}
