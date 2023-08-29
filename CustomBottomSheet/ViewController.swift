//
//  ViewController.swift
//  CustomBottomSheet
//
//  Created by Keerthi Devipriya(kdp) on 28/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constant {
        static let margin: CGFloat = 16
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Creating 5 buttons to support 5 styles of bottom sheet (fit, small, medium, large, fill)
    lazy var fitBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(gotoBtnTapped), for: .touchUpInside)
        btn.tag = 1
        return btn
    }()
    
    lazy var smallBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var mediumBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var largeBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var fillBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureView()
        configureViewHierarchy()
    }

    func configure() {
        self.containerView.backgroundColor = .red
        fitBtn.setTitle("Fit", for: .normal)
        /*smallBtn.setTitle("Small", for: .normal)
        mediumBtn.setTitle("Medium", for: .normal)
        largeBtn.setTitle("Large", for: .normal)
        fillBtn.setTitle("Fill", for: .normal)*/
    }

    func configureView() {
        containerView.addSubview(fitBtn)
        /*containerView.addSubview(smallBtn)
        containerView.addSubview(mediumBtn)
        containerView.addSubview(largeBtn)
        containerView.addSubview(fillBtn)*/
        self.view.addSubview(containerView)
    }
    
    func configureViewHierarchy() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

            fitBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            /*smallBtn.topAnchor.constraint(equalTo: fitBtn.bottomAnchor, constant: Constant.margin),
            mediumBtn.topAnchor.constraint(equalTo: smallBtn.bottomAnchor, constant: Constant.margin),
            largeBtn.topAnchor.constraint(equalTo: mediumBtn.bottomAnchor, constant: Constant.margin),
            fillBtn.topAnchor.constraint(equalTo: largeBtn.bottomAnchor, constant: Constant.margin),
            
            smallBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mediumBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            largeBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            fillBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)*/

        ])
    }
}

extension ViewController {
    @objc func gotoBtnTapped(sender: UIButton!) {
        print("btn taped--")
    }
    @objc func buttonAction() {
        print("btn taped---")
    }
}

