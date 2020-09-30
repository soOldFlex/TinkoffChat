//
//  ChatListTableViewCell.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol ConfigurableView {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}

protocol ChatListCellConfig: ConfigurableView {
    
}

final class ChatListTableViewCell: UITableViewCell {
    static let cellID = "ChatListCell"
    
    @IBOutlet weak var onlineIndicator: UIImageView! {
        didSet {
            onlineIndicator.isHidden = true
        }
    }
    @IBOutlet weak var chatImageView: UIImageView! {
        didSet {
            chatImageView.layer.cornerRadius = chatImageView.frame.height / 2
            chatImageView.clipsToBounds = true
            chatImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var personModel: PersonModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ChatListTableViewCell: ChatListCellConfig {
    typealias ConfigurationModel = PersonModel
    
    func configure(with model: ConfigurationModel) {
        self.personModel = model
        onlineIndicator.isHidden = model.isOnline
        imageView?.image = model.image
        nameLabel.text = model.name
        lastMessageLabel.text = model.lastMessage
        dateLabel.text = Date.getDateString(from: model.lastMessageDate ?? Date())
    }
}

extension ChatListTableViewCell {
    private func setupAllViews() {
        
    }
}
