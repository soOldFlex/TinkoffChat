//
//  ProfilePresenter.swift
//  TinkoffChat
//
//  Created by iMac on 23.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol ProfilePresenter: AnyObject {
    init(view: ProfileView)
}


final class ProfilePresenterImpl: ProfilePresenter {
    
    private weak var view: ProfileView?
    
    init(view: ProfileView) {
        self.view = view
    }
}
