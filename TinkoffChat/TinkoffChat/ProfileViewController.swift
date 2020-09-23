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
    
    //MARK: - Private Properies
    private var imagePicker: UIImagePickerController!
    
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
    
    @IBAction func editButtonTapped(_ sender: Any) {
        createChooseAlert()
    }
    
   //MARK: - Life Methods
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        print(UIDevice.current.name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        print("Edit Button frame is: ", editButton.frame) //Фрейм недействительный(относительно родителя), т.к на этом этапе у вьюКонтролера еще не просчитаны размеры родительской вьюхи
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
        print(#function)
        print("Edit Button frame is: ", editButton.frame) //НА этом этапе размеры уже просчитаны и можно оперрировать фреймами и т.д
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    //MARK: - Private Methods
    private func displayAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func createChooseAlert() {
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let takePictureAction = UIAlertAction(title: "Take a Picture", style: .default) { [weak self] _  in
            self?.takePicture()
        }
        let choosePictureAction = UIAlertAction(title: "Choose from Gallery", style: .default) { [weak self] action in
            self?.choosePicture()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(takePictureAction)
        alertController.addAction(choosePictureAction)
        present(alertController, animated: true, completion: nil)
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

//MARK: - UIIMagePickerControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            logoImageView.image = pickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    private func takePicture() {
        guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) else {
            displayAlertWith(title: "Error", message: "You don't have camera")
            return
        }
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func choosePicture() {
        guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) else {
            displayAlertWith(title: "Error", message: "Can't go to gallery")
            return
        }
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
}

