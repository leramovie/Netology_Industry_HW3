import UIKit

@available(iOS 13.0, *)

protocol FeedViewOutput {
  
  var navigationController: UINavigationController? { get set }
  
  func showPost()
}

final class FeedViewController: UIViewController {

    var output: FeedViewOutput?

    
//    let post: Post = Post(title: "Пост")
    
    private let feedContainerView: FeedContainerView = {
        let feedView = FeedContainerView()
        return feedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedContainerView.onTapBlock = { [weak self] in
              self?.output?.showPost()
            
            guard let postViewController = self?.storyboard?.instantiateViewController(identifier: "PostViewController") as? PostViewController else { return }
            self?.navigationController?.pushViewController(postViewController, animated: true)
        }
        
        output?.navigationController = self.navigationController
        
        setupLayout()
    }
    
    //MARK: Properties from RayWenderlich
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    var previous = NSDecimalNumber.one
    var current = NSDecimalNumber.one
    var position: UInt = 1
    var updateTimer: Timer?
    
    func registerBackgroundTask() {
      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
        self?.endBackgroundTask()
      }
      assert(backgroundTask != .invalid)
    }
      
    func endBackgroundTask() {
      print("Background task ended.")
      UIApplication.shared.endBackgroundTask(backgroundTask)
      backgroundTask = .invalid
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
    
    
    //MARK: Delegate methods
    func didTapCreatePostButton() {
        
        feedContainerView.onTapBlock = { [weak self] in
            
            guard let postViewController = self?.storyboard?.instantiateViewController(identifier: "PostViewController") as? PostViewController else { return }
            self?.navigationController?.pushViewController(postViewController, animated: true)
        }
     }
    
    func didTapOpenCreatedPostButton() {
        
        feedContainerView.onTapBlock = { [weak self] in
        
            guard let postViewController = self?.storyboard?.instantiateViewController(identifier: "PostViewController") as? PostViewController else { return }
            self?.navigationController?.pushViewController(postViewController, animated: true)
        }
     }
}

