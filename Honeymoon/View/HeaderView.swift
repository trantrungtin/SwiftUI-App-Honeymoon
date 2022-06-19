//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    @Binding var showGuideView: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
