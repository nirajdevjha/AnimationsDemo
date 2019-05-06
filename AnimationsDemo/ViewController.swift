//
//  ViewController.swift
//  AnimationsDemo
//
//  Created by Niraj Jha on 06/05/19.
//  Copyright © 2019 Niraj Jha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "penguin")
        imageView = UIImageView(image: image)
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    // MARK: - Button Action
    
    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        
        //default behavior is to use ease in / ease out...3
//        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity
                break
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .green
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        
    }
    
    // MARK: - Private
    
    
    
}

