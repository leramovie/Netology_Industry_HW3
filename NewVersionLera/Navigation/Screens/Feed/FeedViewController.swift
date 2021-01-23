import UIKit

@available(iOS 13.0, *)

protocol FeedViewOutput {
  
  var navigationController: UINavigationController? { get set }
  
  func showPost()
}

final class FeedViewController: UIViewController {

    var output: FeedViewOutput?

        
    private let feedContainerView: FeedContainerView = {
        let feedView = FeedContainerView()
        return feedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedContainerView.onTap = { [weak self] in
              self?.output?.showPost()
        }
        
        output?.navigationController = self.navigationController
        
        setupLayout()
    }

    
    private func setupLayout() {
        view.addSubviews(feedContainerView)
        
        let constraints = [
            
            feedContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            feedContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
//    //MARK: Delegate methods
//    func didTapCreatePostButton() {
//
//        feedContainerView.onTapBlock = { [weak self] in
//
//            guard let postViewController = self?.storyboard?.instantiateViewController(identifier: "PostViewController") as? PostViewController else { return }
//            self?.navigationController?.pushViewController(postViewController, animated: true)
//        }
//     }
//
//    func didTapOpenCreatedPostButton() {
//
//        feedContainerView.onTapBlock = { [weak self] in
//
//            guard let postViewController = self?.storyboard?.instantiateViewController(identifier: "PostViewController") as? PostViewController else { return }
//            self?.navigationController?.pushViewController(postViewController, animated: true)
//        }
//     }
}

