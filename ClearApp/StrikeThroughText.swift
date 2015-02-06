//
//  StrikeThroughText.swift
//  ClearApp
//
//  Created by Victor Tavares on 2/5/15.
//  Copyright (c) 2015 Private. All rights reserved.
//

import UIKit
import QuartzCore

class StrikeThroughText: UILabel {
    
    let strikeThroughLayer: CALayer
    var strikeThrough: Bool {
        didSet {
            strikeThroughLayer.hidden = !strikeThrough
            if strikeThrough {
                resizeStrikeThrough()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not Supported")
    }
    
    override init(frame: CGRect) {
        strikeThroughLayer = CALayer()
        strikeThroughLayer.backgroundColor = UIColor.whiteColor().CGColor
        strikeThroughLayer.hidden = true
        strikeThrough = false
        
        super.init(frame: frame)
        layer.addSublayer(strikeThroughLayer)
    }
    
    let kStrikeOutThickness: CGFloat = 2.0
    func resizeStrikeThrough() {
        let textSize = text!.sizeWithAttributes([NSFontAttributeName:font])
        strikeThroughLayer.frame = CGRect(x:0, y:bounds.size.height/2,width: textSize.width, height: kStrikeOutThickness)
    }
    
    
    

}
