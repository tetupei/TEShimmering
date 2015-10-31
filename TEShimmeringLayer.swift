//
//  TEShimmeringLayer.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

class TEShimmeringLayer: CALayer {
    var contentLayer: CALayer? {
        didSet(newValue) {
            guard let _ = newValue else { return }
            self.updateShimmering()
        }
    }
    
    func updateShimmering() {
        let fadeAnimation = TEAnimation.fadeAnimation(<#T##layer: CALayer##CALayer#>, opacity: <#T##CGFloat#>, duration: <#T##CFTimeInterval#>)
    }

}
