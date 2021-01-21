//
//  PostPresenter.swift
//  Navigation
//
//  Created by Valery Shel on 20.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostPresenter: FeedViewOutput {
  
    let post = Post(title: "Post") 
  
  var navigationController: UINavigationController?
  
  func showPost() {
    let postVC = PostViewController()
    postVC.post = post
    navigationController?.pushViewController(postVC, animated: true)
  }
}
