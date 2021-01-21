//
//  LoginViewController.swift
//  Navigation
//
//  Created by Valery Shel on 17.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LoginViewController: UIViewController, LoginViewDelegate {
    
    weak var authDelegate: LoginViewControllerDelegate?
   
    private let loginView: LoginView = {
        let loginView = LoginView()
        loginView.backgroundColor = .white
        return loginView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupLayout()
        
        loginView.delegate = self
        
        /// Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    // MARK: Keyboard actions
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height + 50 //Высота кнопки login
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height , right: 0)
        }
    }
    
    private func setupLayout() {
        
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView, loginView)
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            loginView.topAnchor.constraint(equalTo: contentView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func didTapLoginButton(filledLogin: String, filledPassword: String) {    
       
        authDelegate?.checkLogin(filledLogin, completion: { (isLoginCorrect) in
            if isLoginCorrect {
                authDelegate?.checkPassword(filledPassword, completion: { (isPasswordCorrect) in
                    if isPasswordCorrect {
                        
                        let storyboard1 = UIStoryboard.init(name: "Main", bundle: nil)

                        guard let profileViewController = storyboard1.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {
                            return
                        }

                        navigationController?.pushViewController(profileViewController, animated: true)

                    } else {
                        print ("Пароль не тот!")
                    }
                })
            } else {
                print ("Не сходятся логин/пасс")
            }
        })
    }
}

@available(iOS 13.0, *)
extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}
