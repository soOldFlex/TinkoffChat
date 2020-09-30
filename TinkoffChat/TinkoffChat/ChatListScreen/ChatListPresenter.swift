//
//  ChatListPresenter.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol ChatListPresenter: AnyObject {
    var countOfMessages: Int { get }
    init(view: ChatListView)
}

final class ChatListPresenterImpl: ChatListPresenter {
    var countOfMessages: Int {
        messages.count
    }
    private let messages = ["Some", "Some"]
    private weak var view: ChatListView?
    
    init(view: ChatListView) {
        self.view = view
    }
    
}
