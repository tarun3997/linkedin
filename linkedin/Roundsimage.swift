//
//  Roundsimage.swift
//  linkedin
//
//  Created by Apple 3 on 15/06/24.
//

import UIKit

class Roundsimage: UIImageView {
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = min(bounds.width, bounds.height)/2
        layer.masksToBounds = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = min(bounds.width, bounds.height)/2
    }
}
