//
//  WelcomeViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    private let dataRetriver = URLSessionDataRetriever()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction private func startWasPressed(_ sender: UIButton) {
        let posts = PostsTableViewController(dataRetriever: dataRetriver)
        present(UINavigationController(rootViewController: posts), animated: true)
    }
}


//extension UIViewController {
//    func present(_ viewController: UIViewController,
//                 inFullScreen: Bool = true,
//                 _ completion: (() -> Void)? = nil) {
//        if inFullScreen {
//            viewController.modalPresentationStyle = .fullScreen
//        }
//
//        present(viewController, animated: true, completion: completion)
//    }
//}
