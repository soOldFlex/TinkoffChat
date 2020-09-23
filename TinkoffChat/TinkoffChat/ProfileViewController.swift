//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Admin on 16.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol ProfileView: AnyObject {
    
}

typealias Completed = ((ProfileViewController.Events) -> ())

class ProfileViewController: UIViewController {
    //TODO: - Вынести в протокол делегирование по клоужеру
    enum Events {
        case someEvent
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    
    //MARK: - Public Properties
    
    var presenter: ProfilePresenter!
    var onComplete: Completed?
    
    
    //MARK: - IBActions
    
    
   //MARK: - Life Methods
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        setupAllView()
    }
    
    override func viewWillLayoutSubviews() {
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onComplete?(.someEvent)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }


}

//MARK: - ViewExtension
extension ProfileViewController: ProfileView {
    
}

//MARK: - UISetupExtension
extension ProfileViewController {
    private func setupAllView() {
        setupNAvigationController()
        setupLogoView()
        setupSaveButton()
    }
    
    private func setupNAvigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
    private func setupLogoView() {
        logoImageView.layer.cornerRadius = logoImageView.frame.height / 2
    }
    
    private func setupSaveButton() {
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
    }
}

