//
//  StepTrackerHomeVC.swift
//  StepTracker
//
//  Created by Gaurang Bham on 12/13/21.
//

import UIKit
import CoreMotion

class StepTrackerHomeVC: UIViewController {
    
    let pedometer = CMPedometer()
    var num = String()
    var day = String()
    var stepDays = [StepDayModel]()
    var isStepsAvailable = CMPedometer.isStepCountingAvailable()
    
    var StepCounterDaysList: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .white
        return tableview
    }()
    
    let stepsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Steps_White")
        return imageView
    }()
    
    let stepsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.HelveticaNeueBold, size: 18)
        label.text = "StepTracker by Gaurang"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getSteps()
        setUpViews()
        registerTableView()
    }
    
    func getSteps() {
        let group = DispatchGroup()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdYYYY")
        if self.isStepsAvailable {
            let calendar = Calendar.current
            let today = Date()
            for i in 0...6 {
                group.enter()
                let modifiedDate = Calendar.current.date(byAdding: .day, value: -i, to: today)!
                self.pedometer.queryPedometerData(from: calendar.startOfDay(for: modifiedDate), to: modifiedDate) { (data, error) in
                    var thisCell = StepDayModel()
                    self.num = data?.numberOfSteps.stringValue ?? "N/A"
                    self.day = dateFormatter.string(from: data?.startDate ?? today)
                    thisCell.date = self.day
                    thisCell.steps = self.num
                    let distance = round(Double(truncating: data?.distance ?? 0) * 10) / 10.0
                    thisCell.distance = String(distance)
                    thisCell.floorsAsc = data?.floorsAscended?.stringValue ?? "N/A"
                    thisCell.floorsDsc = data?.floorsDescended?.stringValue ?? "N/A"
                    let pace = round(Double(truncating: data?.averageActivePace ?? 0) * 10) / 10.0
                    thisCell.pace = String(pace)
                    self.stepDays.append(thisCell)
                    group.leave()
                }
            }
        } else {
            var thisCell = StepDayModel()
            self.num = "N/A"
            self.day = dateFormatter.string(from: Date())
            thisCell.date = self.day
            thisCell.steps = self.num
            self.stepDays.append(thisCell)
            
    //            Use as Mock Data
            let stepDay2 = StepDayModel(date: "13 December, 2021", steps: "476", distance: "1000", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay2)
            let stepDay3 = StepDayModel(date: "12 December, 2021", steps: "306", distance: "800", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay3)
            let stepDay4 = StepDayModel(date: "11 December, 2021", steps: "406", distance: "900", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay4)
            let stepDay5 = StepDayModel(date: "10 December, 2021", steps: "476", distance: "1000", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay5)
            let stepDay6 = StepDayModel(date: "09 December, 2021", steps: "306", distance: "800", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay6)
            let stepDay7 = StepDayModel(date: "08 December, 2021", steps: "406", distance: "900", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
            self.stepDays.append(stepDay7)

        }
        group.notify(queue: .main) {
            self.StepCounterDaysList.reloadData()
        }
    }
    
    func registerTableView() {
        StepCounterDaysList.delegate = self
        StepCounterDaysList.dataSource = self
        StepCounterDaysList.register(StepTrackerTableViewCell.self, forCellReuseIdentifier: String(describing: StepTrackerTableViewCell.self))
    }
    
    func setUpViews() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(StepCounterDaysList)
        headerView.addSubview(stepsIcon)
        headerView.addSubview(stepsLabel)
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: view.frame.height / 8),
            stepsIcon.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 25),
            stepsIcon.widthAnchor.constraint(equalToConstant: 40),
            stepsIcon.heightAnchor.constraint(equalToConstant: 40),
            stepsIcon.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20),
            stepsLabel.centerYAnchor.constraint(equalTo: stepsIcon.centerYAnchor),
            stepsLabel.leftAnchor.constraint(equalTo: stepsIcon.rightAnchor, constant: 20),
            StepCounterDaysList.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            StepCounterDaysList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            StepCounterDaysList.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        StepCounterDaysList.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        stepsIcon.translatesAutoresizingMaskIntoConstraints = false
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension StepTrackerHomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StepTrackerTableViewCell()
        cell.date.text = stepDays[indexPath.row].date 
        cell.steps.text = "\(stepDays[indexPath.row].steps) Steps"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StepTrackerDetailsVC()
        vc.stepDetails = stepDays[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 8
    }
}

