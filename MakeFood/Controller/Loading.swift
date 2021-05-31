//
//  Loading.swift
//  MakeFood
//
//  Created by Rizqi Imam on 31/05/21.
//

import UIKit

class Loading: UIVisualEffectView {

    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    private var activityIndictor: UIActivityIndicatorView!
    private let label: UILabel = UILabel()
    private let blurEffect = UIBlurEffect(style: .light)
    private let vibrancyView: UIVisualEffectView
    
    private func initActivityIndicator() {
        if #available(iOS 13.0, *) {
            activityIndictor = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        } else {
            activityIndictor = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        }
    }
    
    init(text: String) {
        self.text = text
        vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        initActivityIndicator()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = ""
        vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: aDecoder)
        initActivityIndicator()
        setup()
    }
    
    func setup() {
        contentView.addSubview(vibrancyView)
        contentView.addSubview(activityIndictor)
        contentView.addSubview(label)
        activityIndictor.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = superview {
            
            let width = superview.frame.size.width / 2.3
            let height: CGFloat = 50.0
            frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                y: superview.frame.height / 2 - height / 2,
                                width: width,
                                height: height)
            vibrancyView.frame = self.bounds
            
            let activityIndicatorSize: CGFloat = 40
            activityIndictor.frame = CGRect(x: 5,
                                            y: height / 2 - activityIndicatorSize / 2,
                                            width: activityIndicatorSize,
                                            height: activityIndicatorSize)
            
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
            label.text = text
            label.textAlignment = NSTextAlignment.center
            label.frame = CGRect(x: activityIndicatorSize + 5,
                                 y: 0,
                                 width: width - activityIndicatorSize - 15,
                                 height: height)
            label.textColor = UIColor.gray
            label.font = UIFont.boldSystemFont(ofSize: 16)
            
            backgroundColor = UIColor.lightGray
        }
    }
    
    func show() {
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
}
