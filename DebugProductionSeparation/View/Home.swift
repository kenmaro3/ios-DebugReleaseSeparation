//
//  Home.swift
//  DebugProductionSeparation
//
//  Created by Kentaro Mihara on 2023/10/05.
//

import SwiftUI

struct Home: View {
    let mytext = Bundle.main.object(forInfoDictionaryKey: "my_setting") as! String
    var body: some View {
        Text(mytext)
    }
}

#Preview {
    Home()
}
