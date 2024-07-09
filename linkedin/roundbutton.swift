//
//  roundbutton.swift
//  linkedin
//
//  Created by Apple 3 on 26/06/24.
//

import UIKit

import UIKit

class roundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor.systemBlue 
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.systemBlue.withAlphaComponent(0.8) : UIColor.systemBlue
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? UIColor.systemBlue : UIColor.lightGray
        }
    }
}
