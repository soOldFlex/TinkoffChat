//
//  MainFactory.swift
//  TinkoffChat
//
//  Created by iMac on 23.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol MainFactory {
    func getProfile() -> ProfileViewController
    func getChat() -> ChatListViewController
}

final class MainFactoryImpl: MainFactory {
    //TODO: - Вынести ИД Сторибордов в отдельный домен
    private let presenterFactory: MainPresentersFactory
    private let storyboards = StoryboardsID.share
    private let viewControllersID = ViewControllersID.share
    
    init(presenterFactory: MainPresentersFactory) {
        self.presenterFactory = presenterFactory
    }
    
    func getProfile() -> ProfileViewController {
        guard let initialVc = storyboards.main.instantiateInitialViewController() as? ProfileViewController else {
            fatalError("Bubub")
        }
        let presenter = presenterFactory.profilePresenter(for: initialVc)
        initialVc.presenter = presenter
        return initialVc
    }
    
    func getChat() -> ChatListViewController {
        guard let vc = storyboards.chat.instantiateViewController(withIdentifier: viewControllersID.chatListVC) as? ChatListViewController else {
            fatalError("BAB")
        }
        let presenter = presenterFactory.chatListPresenter(for: vc)
        vc.presenter = presenter
        return vc
    }
}
