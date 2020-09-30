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
}

final class MainFactoryImpl: MainFactory {
    //TODO: - Вынести ИД Сторибордов в отдельный домен
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let presenterFactory: MainPresentersFactory
    
    init(presenterFactory: MainPresentersFactory) {
        self.presenterFactory = presenterFactory
    }
    
    func getProfile() -> ProfileViewController {
        guard let initialVc = storyboard.instantiateInitialViewController() as? ProfileViewController else {
            fatalError("Bubub")
        }
        let presenter = presenterFactory.profilePresenter(for: initialVc)
        initialVc.presenter = presenter
        return initialVc
    }
}
