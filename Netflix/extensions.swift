//
//  extensions.swift
//  Netflix
//
//  Created by FabVinco on 4/24/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import Foundation
import Font_Awesome_Swift


public func getIconByText(name: String!) -> FAType?{
    if let nam = name {
        switch(nam) {
            case "FABell":
                return FAType.FABell
            case "FACheck":
                return FAType.FACheck
            case "FANavicon":
                return FAType.FANavicon
            default:
                return nil
        }
    }else {
        return nil
    }
}
