//
//  ChatModel.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

struct PersonModel {
    var name: String
    var image: UIImage?
    var lastMessage: String {
        messages.last?.text ?? "No messages yet?"
    }
    var lastMessageDate: Date? {
        messages.last?.date
    }
    var isOnline: Bool
    var messages: [Message]
}

struct Message {
    let text: String
    let date: Date
}
