//
//  BaseViewController.swift
//  AsyncAwaitTest_5
//
//  Created by gyuni on 2022/05/02.
//

import UIKit

/*
 ImageView와 Button을 화면에 그려주는 ViewController 입니다.
 */
class BaseViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.configuration = UIButton.Configuration.filled()
        button.setTitle("Download", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 52),
        ])
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -32),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
    }
    
}
