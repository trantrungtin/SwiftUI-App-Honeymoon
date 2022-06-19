//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - PROPERTY
    var title: String
    var subtitle: String
    var destination: String
    var icon: String
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                
                Divider().padding(.bottom, 4)
                Text(destination)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

// MARK: - PREVIEW
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subtitle: "Swipe right", destination: "This is a destination", icon: "heart.circle")
    }
}
