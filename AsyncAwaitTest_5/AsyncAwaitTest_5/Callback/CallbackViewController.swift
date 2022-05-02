//
//  CallbackViewController.swift
//  AsyncAwaitTest_5
//
//  Created by gyuni on 2022/05/03.
//

import UIKit

class CallbackViewController: BaseViewController {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "callback"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buttonTapped(_ sender: UIButton) {
        Task {
            do {
                self.imageView.image = try await downloadImage()
            } catch {
                print(error)
            }
        }
    }
    
    private func downloadImage() async throws -> UIImage? {
        let image: UIImage? = try await withCheckedThrowingContinuation { continuation in
            session.dataTask(with: ImageURL.errorLink) { data, response, error in
                switch (data, error) {
                case (let data?, nil):
                    continuation.resume(returning: UIImage(data: data))
                case (nil, let error?):
                    continuation.resume(throwing: error)
                default:
                    continuation.resume(throwing: "에러")
                }
            }.resume()
        }
        
        return image
    }
}
