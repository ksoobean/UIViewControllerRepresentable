//
//  ContentView.swift
//  SwiftUI(WithUIViewController)
//
//  Created by master on 2019/10/23.
//  Copyright © 2019 ksb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if state.switchOn == true {
            return Text("switch On")
        } else {
            return Text("switch Off")
        }
        
        
    }
}
