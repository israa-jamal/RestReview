//
//  BaseView.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/22/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit
@IBDesignable class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        self.configure()

    }
    func configure(){
        
    }
}
