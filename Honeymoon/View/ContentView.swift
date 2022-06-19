//
//  ContentView.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        CardView(honeymoon: honeymoonData[1])
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
