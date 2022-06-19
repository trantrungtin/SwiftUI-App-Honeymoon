//
//  GuideView.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import SwiftUI

struct GuideView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                
                Text("Discover and pick the perfect destination ofr your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like", subtitle: "Swipe right", destination: "Do you like this destination? touch the screen and swipe right. It will be saved to the favourites.", icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss", subtitle: "Swipe left", destination: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.", icon: "xmark.circle")
                    
                    GuideComponent(title: "Book", subtitle: "Tap the button", destination: "Our selection of honeymoon reports is perfect setting for you to embark your new life together.", icon: "checkmark.square")
                    
                    Spacer(minLength: 10)
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Continue".uppercased())
                            .font(.headline)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Capsule().fill(.pink))
                            .foregroundColor(.white)
                    }
                }
                
                Spacer(minLength: 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

// MARK: - PREVIEW
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
