//
//  FeedContainerView.swift
//  Navigation
//
//  Created by Valery Shel on 15.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedContainerView: UIView {
    
    var onTap: (() -> Void)?

    //MARK: UI elements
    private lazy var createNewPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.roundCornersWithRadius(5)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(createNewPostButtonTouched), for: .touchUpInside)
        button.setTitle("Create new post", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var showCreatedPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.roundCornersWithRadius(5)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(createNewPostButtonTouched), for: .touchUpInside)
        button.setTitle("Show created post", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init[coder:] has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews(createNewPostButton, showCreatedPostButton)
        
        let constraints = [
            createNewPostButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createNewPostButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            createNewPostButton.heightAnchor.constraint(equalToConstant: 50),
            createNewPostButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            createNewPostButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            //createNewPostButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),

            
            showCreatedPostButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showCreatedPostButton.topAnchor.constraint(equalTo: createNewPostButton.bottomAnchor, constant: 30),
            showCreatedPostButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            showCreatedPostButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            showCreatedPostButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    @objc func createNewPostButtonTouched(sender:UIButton!) {
        onTap?()
    }
    
    @objc func openCreatedPostButtonTapped(sender:UIButton!) {
        onTap?()
    }
}
