//
//  DelegateViewController.swift
//  AsyncAwaitTest_5
//
//  Created by gyuni on 2022/05/03.
//

import UIKit

class DelegateViewController: BaseViewController {
    
    private let delegate = DelegateViewController_URLSessionDelegate()
    
    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: delegate, delegateQueue: nil)
    }()
    
    override func buttonTapped(_ sender: UIButton) {
        Task {
            do {
                imageView.image = try await downloadImage()
            } catch {
                print("⚠️ \(error)")
            }
        }
    }
    
    private func downloadImage() async throws -> UIImage? {
        let task = session.dataTask(with: ImageURL.칼)
        task.resume()
        
        let imageData: Data = try await withCheckedThrowingContinuation { continuation in
            delegate.setContinuation(continuation: continuation)
        }
        
        return UIImage(data: imageData)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "delegate"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
