//
//  MainPresentersFactory.swift
//  TinkoffChat
//
//  Created by iMac on 23.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol MainPresentersFactory {
    func profilePresenter(for view: ProfileViewController) -> ProfilePresenterImpl
    func chatListPresenter(for view: ChatListView) -> ChatListPresenterImpl
}

struct MainPresentersFactoryImpl: MainPresentersFactory {
    func profilePresenter(for view: ProfileViewController) -> ProfilePresenterImpl {
        let presenter = ProfilePresenterImpl(view: view)
        return presenter
    }
    
    func chatListPresenter(for view: ChatListView) -> ChatListPresenterImpl {
        let presenter = ChatListPresenterImpl(view: view)
        return presenter
    }
}
