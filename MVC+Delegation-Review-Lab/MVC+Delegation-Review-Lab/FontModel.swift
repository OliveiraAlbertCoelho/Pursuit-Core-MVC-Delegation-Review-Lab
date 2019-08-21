//
//  FontModel.swift
//  MVC+Delegation-Review-Lab
//
//  Created by albert coelho oliveira on 8/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit

struct fontModel {
    
    var fontSize: CGFloat  = 15
    mutating func changeSize (size: CGFloat){
        fontSize = size
    }
    func getCurrent ()-> CGFloat{
        return fontSize
    }
}
