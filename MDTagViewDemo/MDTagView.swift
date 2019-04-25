//
//  MDTagView.swift
//  MDTagViewDemo
//
//  Created by  MarvinChan on 2019/4/24.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit
private let kTagFont = UIFont.systemFont(ofSize: 8, weight: .regular)
class MDTagView: UIView {

    var tagString: String? {
        didSet {
            content.setTitle(tagString, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        addSubview(dotView)
        addSubview(line)
        addSubview(content)
        
        content.layer.cornerRadius = self.bounds.height / 2
        content.layer.masksToBounds = true
        content.clipsToBounds = true
    }
    
    private lazy var dotView: MDDotView = {
       let dotV = MDDotView(frame: CGRect(x: 0, y: 0, width: self.cmy_height(), height: self.cmy_height()))
        return dotV
    }()
    
    private lazy var line: UILabel = {
        let label = UILabel(frame: CGRect(x: dotView.cmy_right()-5, y: self.cmy_height()/2 - 0.5, width: 6, height: 1))
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var content: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: line.cmy_right(), y: 0, width: self.cmy_width() - line.cmy_right(), height: self.cmy_height())
        btn.setImage(#imageLiteral(resourceName: "tag@2x.png"), for: [])
        btn.backgroundColor = UIColor(red: 222/255.0, green: 225/255.0, blue: 226/255.0, alpha: 1)
        btn.titleLabel?.font = kTagFont
        btn.titleLabel?.textAlignment = .center
        btn.setTitleColor(UIColor(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1), for: [])
        return btn
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    static func getWidth(_ tagString: String) -> CGFloat{
        let size = CGSize(width:CGFloat.greatestFiniteMagnitude, height:CGFloat.greatestFiniteMagnitude)
        let text = tagString as NSString
        let font = kTagFont
        
        let rect = text.boundingRect(with: size,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font as Any],
                                     context: nil)
        return rect.width + 50
    }
}
