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
}

struct MainPresentersFactoryImpl: MainPresentersFactory {
    func profilePresenter(for view: ProfileViewController) -> ProfilePresenterImpl {
        let presenter = ProfilePresenterImpl(view: view)
        return presenter
    }
}
