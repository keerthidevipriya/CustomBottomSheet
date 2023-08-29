//
//  ViewController.swift
//  CustomBottomSheet
//
//  Created by Keerthi Devipriya(kdp) on 28/08/23.
//

import UIKit

enum SheetType {
    case fit
    case small
    case medium
    case large
    case fill
}

class ViewController: UIViewController {
    enum Constant {
        static let margin: CGFloat = 16
    }
    var sheetType: [BottomSheetController.PreferredSheetSizing] = [.fit, .small, .medium, .large, .fill]
    /// Creating 5 buttons to support 5 styles of bottom sheet (fit, small, medium, large, fill)
    lazy var fitBtn: UIButton = {
        let btn: UIButton = UIButton()//frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = .gray
        btn.setTitle("Fit", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 1
        return btn
    }()
    lazy var smallBtn: UIButton = {
        let btn: UIButton = UIButton()//frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = .gray
        btn.setTitle("Small", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 2
        return btn
    }()
    
    lazy var mediumBtn: UIButton = {
        let btn: UIButton = UIButton()//frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = .gray
        btn.setTitle("Medium", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 3
        return btn
    }()
    
    lazy var largeBtn: UIButton = {
        let btn: UIButton = UIButton()//UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = .gray
        btn.setTitle("Large", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 4
        return btn
    }()
    
    lazy var fillBtn: UIButton = {
        let btn: UIButton = UIButton()//frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = .gray
        btn.setTitle("Fill", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 5
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewHierarchy()
    }
    
    func configureView() {
        self.view.addSubview(fitBtn)
        self.view.addSubview(smallBtn)
        self.view.addSubview(mediumBtn)
        self.view.addSubview(largeBtn)
        self.view.addSubview(fillBtn)
    }

    func configureViewHierarchy() {
        NSLayoutConstraint.activate([

            fitBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            fitBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            smallBtn.topAnchor.constraint(equalTo: fitBtn.bottomAnchor, constant: Constant.margin),
            mediumBtn.topAnchor.constraint(equalTo: smallBtn.bottomAnchor, constant: Constant.margin),
            largeBtn.topAnchor.constraint(equalTo: mediumBtn.bottomAnchor, constant: Constant.margin),
            fillBtn.topAnchor.constraint(equalTo: largeBtn.bottomAnchor, constant: Constant.margin),
            
            smallBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mediumBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            largeBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fillBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}

extension ViewController {
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        let vc = MyBottomSheet()
        vc.preferredSheetCornerRadius = 8
        vc.preferredSheetBackdropColor = .clear
        let tag = btnsendtag.tag
        switch tag {
        case 1, 2, 3, 4, 5:
            vc.preferredSheetSizing = sheetType[tag-1]
            present(vc, animated: true)
        default:
            print("btn taped--\(tag)")
            break
        }
    }
}

