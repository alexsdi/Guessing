//
//  Externals.swift
//  GuessingA
//
//  Created by Saravanan on 07/09/17.
//  Copyright © 2017 Twilight-MAC. All rights reserved.
//

import Foundation

extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}