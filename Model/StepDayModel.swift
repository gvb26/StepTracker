//
//  StepDayModel.swift
//  StepTracker
//
//  Created by Gaurang Bham on 12/13/21.
//

import Foundation

struct StepDayModel: Codable {
    var date = String()
    var steps = String()
    var distance = String()
    var floorsAsc = String()
    var floorsDsc = String()
    var pace = String()
}
