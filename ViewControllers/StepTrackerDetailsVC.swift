//
//  StepTrackerDetailsVC.swift
//  StepTracker
//
//  Created by Gaurang Bham on 12/13/21.
//

import Foundation
import UIKit

class StepTrackerDetailsVC: UIViewController {
    
    var stepDetails = StepDayModel()
    
    let stepsNum: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 35)
        label.textColor = .white
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        label.textColor = .white
        return label
    }()
    
    let distanceNum: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        return label
    }()
    
    let floorsAscNum: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        return label
    }()
    
    let floorsDscNum: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        label.textAlignment = .center
        return label
    }()
    
    let paceNum: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        label.textAlignment = .center
        return label
    }()
    
    let stepsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeue, size: 16)
        label.text = "Steps"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Meters"
        label.font = UIFont.init(name: Fonts.HelveticaNeue, size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let floorsAscLabel: UILabel = {
        let label = UILabel()
        label.text = "Floors\nAsc."
        label.font = UIFont.init(name: Fonts.HelveticaNeue, size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let floorsDscLabel: UILabel = {
        let label = UILabel()
        label.text = "Floors\nDesc."
        label.font = UIFont.init(name: Fonts.HelveticaNeue, size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let paceLabel: UILabel = {
        let label = UILabel()
        label.text = "Average\nPace"
        label.font = UIFont.init(name: Fonts.HelveticaNeue, size: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let analysisLabel: UILabel = {
        let label = UILabel()
        label.text = "Well Done!\nKeep it up for tomorrow!"
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 30)
        label.numberOfLines = 4
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let detailsStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.backgroundColor = .white
        return stack
    }()
    
    let stepsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Steps-White")
        return imageView
    }()
    
    let distanceIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Distance")
        return imageView
    }()
    
    let floorsAscIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Floors_Asc")
        return imageView
    }()
    
    let floorsDscIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Floors_Dsc")
        return imageView
    }()
    
    let paceIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pace")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setUpViews()
        setUpLabels()
    }
    
    func setUpLabels() {
        stepsNum.text = "\(stepDetails.steps)"
        dateLabel.text = "\(stepDetails.date)"
        distanceNum.text = "\(stepDetails.distance)"
        floorsAscNum.text = "\(stepDetails.floorsAsc)"
        floorsDscNum.text = "\(stepDetails.floorsDsc)"
        paceNum.text = "\(stepDetails.pace)"
    }
    
    func setUpViews() {
        view.addSubview(stepsNum)
        view.addSubview(dateLabel)
        view.addSubview(stepsLabel)
        view.addSubview(distanceLabel)
        view.addSubview(floorsAscLabel)
        view.addSubview(floorsDscLabel)
        view.addSubview(paceLabel)
        view.addSubview(stepsIcon)
        view.addSubview(distanceIcon)
        view.addSubview(floorsAscIcon)
        view.addSubview(floorsDscIcon)
        view.addSubview(paceIcon)
        view.addSubview(detailsStack)
        view.addSubview(analysisLabel)
        
        
        detailsStack.addArrangedSubview(distanceNum)
        detailsStack.addArrangedSubview(floorsAscNum)
        detailsStack.addArrangedSubview(floorsDscNum)
        detailsStack.addArrangedSubview(paceNum)
        
        detailsStack.isLayoutMarginsRelativeArrangement = true
        detailsStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepsNum.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 100),
            stepsNum.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepsLabel.topAnchor.constraint(equalTo: stepsNum.bottomAnchor, constant: 5),
            stepsLabel.centerXAnchor.constraint(equalTo: stepsNum.centerXAnchor),
            stepsIcon.bottomAnchor.constraint(equalTo: stepsNum.topAnchor, constant: -5),
            stepsIcon.centerXAnchor.constraint(equalTo: stepsNum.centerXAnchor),
            stepsIcon.widthAnchor.constraint(equalToConstant: 50),
            stepsIcon.heightAnchor.constraint(equalToConstant: 50),
            detailsStack.topAnchor.constraint(equalTo: stepsLabel.topAnchor, constant: 100),
            detailsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsStack.widthAnchor.constraint(equalTo: view.widthAnchor),
            detailsStack.heightAnchor.constraint(equalToConstant: view.frame.height / 6),
            analysisLabel.topAnchor.constraint(equalTo: detailsStack.bottomAnchor, constant: 60),
            analysisLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            analysisLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            distanceLabel.topAnchor.constraint(equalTo: distanceNum.bottomAnchor, constant: 10),
            distanceLabel.centerXAnchor.constraint(equalTo: distanceNum.centerXAnchor),
            distanceIcon.bottomAnchor.constraint(equalTo: distanceNum.topAnchor, constant: -5),
            distanceIcon.centerXAnchor.constraint(equalTo: distanceNum.centerXAnchor),
            distanceIcon.widthAnchor.constraint(equalToConstant: 35),
            distanceIcon.heightAnchor.constraint(equalToConstant: 35),
            floorsAscLabel.topAnchor.constraint(equalTo: floorsAscNum.bottomAnchor, constant: 10),
            floorsAscLabel.centerXAnchor.constraint(equalTo: floorsAscNum.centerXAnchor),
            floorsAscIcon.bottomAnchor.constraint(equalTo: floorsAscNum.topAnchor, constant: -5),
            floorsAscIcon.centerXAnchor.constraint(equalTo: floorsAscNum.centerXAnchor),
            floorsAscIcon.widthAnchor.constraint(equalToConstant: 35),
            floorsAscIcon.heightAnchor.constraint(equalToConstant: 35),
            floorsDscLabel.topAnchor.constraint(equalTo: floorsDscNum.bottomAnchor, constant: 10),
            floorsDscLabel.centerXAnchor.constraint(equalTo: floorsDscNum.centerXAnchor),
            floorsDscIcon.bottomAnchor.constraint(equalTo: floorsDscNum.topAnchor, constant: -5),
            floorsDscIcon.centerXAnchor.constraint(equalTo: floorsDscNum.centerXAnchor),
            floorsDscIcon.widthAnchor.constraint(equalToConstant: 35),
            floorsDscIcon.heightAnchor.constraint(equalToConstant: 35),
            paceLabel.topAnchor.constraint(equalTo: paceNum.bottomAnchor, constant: 10),
            paceLabel.centerXAnchor.constraint(equalTo: paceNum.centerXAnchor),
            paceIcon.bottomAnchor.constraint(equalTo: paceNum.topAnchor, constant: -5),
            paceIcon.centerXAnchor.constraint(equalTo: paceNum.centerXAnchor),
            paceIcon.widthAnchor.constraint(equalToConstant: 35),
            paceIcon.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        stepsNum.translatesAutoresizingMaskIntoConstraints = false
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceNum.translatesAutoresizingMaskIntoConstraints = false
        floorsAscNum.translatesAutoresizingMaskIntoConstraints = false
        floorsDscNum.translatesAutoresizingMaskIntoConstraints = false
        paceNum.translatesAutoresizingMaskIntoConstraints = false
        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        floorsAscLabel.translatesAutoresizingMaskIntoConstraints = false
        floorsDscLabel.translatesAutoresizingMaskIntoConstraints = false
        paceLabel.translatesAutoresizingMaskIntoConstraints = false
        stepsIcon.translatesAutoresizingMaskIntoConstraints = false
        distanceIcon.translatesAutoresizingMaskIntoConstraints = false
        floorsAscIcon.translatesAutoresizingMaskIntoConstraints = false
        floorsDscIcon.translatesAutoresizingMaskIntoConstraints = false
        paceIcon.translatesAutoresizingMaskIntoConstraints = false
        analysisLabel.translatesAutoresizingMaskIntoConstraints = false
        view.bringSubviewToFront(distanceLabel)
        view.bringSubviewToFront(floorsAscLabel)
        view.bringSubviewToFront(floorsDscLabel)
        view.bringSubviewToFront(paceLabel)
        view.bringSubviewToFront(distanceIcon)
        view.bringSubviewToFront(floorsAscIcon)
        view.bringSubviewToFront(floorsDscIcon)
        view.bringSubviewToFront(paceIcon)
    }
}
