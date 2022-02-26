//
//  StepTrackerTests.swift
//  StepTrackerTests
//
//  Created by Gaurang Bham on 12/13/21.
//

import XCTest
@testable import StepTracker

class StepTrackerTests: XCTestCase {
    
    func testDataNotAvailable() {
        let vc = StepTrackerHomeVC()
        vc.isStepsAvailable = false
        vc.getSteps()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdYYYY")
        let today = dateFormatter.string(from: Date())
        XCTAssertEqual("N/A", vc.num)
        XCTAssertEqual(today, vc.day)
        XCTAssertEqual(7, vc.stepDays.count)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let rowSelected: () = vc.tableView(vc.StepCounterDaysList, didSelectRowAt: indexPath)
        XCTAssertNotNil(rowSelected)
    }
    
    func testDataReturnsNil() {
        let vc = StepTrackerHomeVC()
        vc.isStepsAvailable = true
        vc.getSteps()
        XCTAssertEqual("", vc.num)
        XCTAssertEqual(0, vc.stepDays.count)
    }
    
    func testDataMocked() {
        var stepDays = [StepDayModel]()
        let stepDay1 = StepDayModel(date: "13 December, 2021", steps: "476", distance: "1000", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
        stepDays.append(stepDay1)
        let stepDay2 = StepDayModel(date: "12 December, 2021", steps: "306", distance: "800", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
        stepDays.append(stepDay2)
        let stepDay3 = StepDayModel(date: "11 December, 2021", steps: "406", distance: "900", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
        stepDays.append(stepDay3)
        XCTAssertEqual(3, stepDays.count)
        
        // Entry 1
        XCTAssertEqual("13 December, 2021", stepDays[0].date)
        XCTAssertEqual("476", stepDays[0].steps)
        XCTAssertEqual("1000", stepDays[0].distance)
        XCTAssertEqual("1", stepDays[0].floorsAsc)
        XCTAssertEqual("2", stepDays[0].floorsDsc)
        XCTAssertEqual("1.23", stepDays[0].pace)
        
        // Entry 2
        XCTAssertEqual("12 December, 2021", stepDays[1].date)
        XCTAssertEqual("306", stepDays[1].steps)
        XCTAssertEqual("800", stepDays[1].distance)
        XCTAssertEqual("1", stepDays[1].floorsAsc)
        XCTAssertEqual("2", stepDays[1].floorsDsc)
        XCTAssertEqual("1.23", stepDays[2].pace)
        
        // Entry 3
        XCTAssertEqual("11 December, 2021", stepDays[2].date)
        XCTAssertEqual("406", stepDays[2].steps)
        XCTAssertEqual("900", stepDays[2].distance)
        XCTAssertEqual("1", stepDays[2].floorsAsc)
        XCTAssertEqual("2", stepDays[2].floorsDsc)
        XCTAssertEqual("1.23", stepDays[2].pace)
    }
    
    func testDetailsPageMocked() {
        let stepDetail = StepDayModel(date: "13 December, 2021", steps: "476", distance: "1000", floorsAsc: "1", floorsDsc: "2", pace: "1.23")
        
        let vc = StepTrackerDetailsVC()
        vc.stepDetails = stepDetail
        vc.viewDidLoad()
        
        XCTAssertEqual("476", vc.stepsNum.text)
        XCTAssertEqual("13 December, 2021", vc.dateLabel.text)
        XCTAssertEqual("1000", vc.distanceNum.text)
        XCTAssertEqual("1", vc.floorsAscNum.text)
        XCTAssertEqual("2", vc.floorsDscNum.text)
        XCTAssertEqual("1.23", vc.paceNum.text)
    }

}
