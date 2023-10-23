//
//  MonthlyWidgetBundle.swift
//  MonthlyWidget
//
//  Created by Caroline Klakegg on 23/10/2023.
//

import WidgetKit
import SwiftUI

@main
struct MonthlyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MonthlyWidget()
        MonthlyWidgetLiveActivity()
    }
}
