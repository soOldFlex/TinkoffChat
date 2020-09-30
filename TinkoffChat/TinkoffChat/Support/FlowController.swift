//
//  FlowController.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


protocol FlowController {
    associatedtype Event
    typealias Completed = ((Event) -> ())
    
    var onCompleted: Completed? { get set }
}
