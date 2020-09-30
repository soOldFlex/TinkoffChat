//
//  ChatListViewController.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ChatListView: AnyObject {
    func reloadData()
}

final class ChatListViewController: UIViewController {
    enum Event {
        case someCase
    }
    
    var onCompleted: Completed?
    
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.register(ChatListTableViewCell.self, forCellReuseIdentifier: ChatListTableViewCell.CellID)
            chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        }
    }
    
    var presenter: ChatListPresenter!
    
    override func loadView() {
        super.loadView()
        onCompleted?(.someEvent)
        setupAllViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ChatListViewController: ChatListView {
    func reloadData() {
        chatTableView.reloadData()
    }
}

extension ChatListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countOfMessages
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chatTableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.CellID, for: indexPath) as? ChatListTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

extension ChatListViewController: UITableViewDelegate {
    
}

extension ChatListViewController {
    private func setupAllViews() {
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Tinkoff Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let mockImage = UIImage()
        let settingsBarButton = UIBarButtonItem(image: mockImage, style: .plain, target: self, action: #selector(onSettiongsBarButtonTapped))
        
    }
    
    @objc private func onSettiongsBarButtonTapped() {
        
    }
}
