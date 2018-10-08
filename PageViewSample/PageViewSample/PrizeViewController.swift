//
//  PrizeViewController.swift
//  PrizeRandomizerDemo
//
//  Created by Brian Voong on 9/14/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class PrizeController: UIViewController {
    
    var prizeIndex: Int? {
        didSet {
            let imageName = "toys_retro_\(prizeIndex!)"
            imageView.image = UIImage(named: imageName)
            prizeLabel.text = "Prize \(prizeIndex ?? 0)"
        }
    }
    
    let prizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let prizeContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        return v
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(prizeContainer)
        prizeContainer.addSubview(imageView)
        
        setupConstraints()
    }
    
    // MARK:- Fileprivate
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            prizeContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            prizeContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            prizeContainer.widthAnchor.constraint(equalToConstant: 240),
            prizeContainer.heightAnchor.constraint(equalToConstant: 240)
            ])
        
        imageView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        view.addSubview(prizeLabel)
        prizeLabel.anchor(top: nil, leading: prizeContainer.leadingAnchor, bottom: prizeContainer.topAnchor, trailing: prizeContainer.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16), size: .init(width: 0, height: 50))
    }
    
}
