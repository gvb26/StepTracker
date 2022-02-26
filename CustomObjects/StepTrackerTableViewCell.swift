//
//  StepTrackerTableViewCell.swift
//  StepTracker
//
//  Created by Gaurang Bham on 12/13/21.
//

import Foundation
import UIKit

class StepTrackerTableViewCell: UITableViewCell {
    
    let date: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        return label
    }()
    
    let steps: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        backgroundColor = .white
        date.textColor = .black
        steps.textColor = .black
        
        addSubview(date)
        addSubview(steps)
        
        date.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        date.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        steps.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        steps.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        date.translatesAutoresizingMaskIntoConstraints = false
        steps.translatesAutoresizingMaskIntoConstraints = false
    }
}
