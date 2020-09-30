//
//  StoryboardsID.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

struct StoryboardsID {
    static let share = StoryboardsID()
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    let chat = UIStoryboard(name: "ChatStoryboard", bundle: nil)
    
    private init() {}
}
