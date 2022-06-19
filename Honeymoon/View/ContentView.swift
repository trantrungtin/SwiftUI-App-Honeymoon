//
//  ContentView.swift
//  Honeymoon
//
//  Created by Tin Tran on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views;
    }()
    
    private func isTopCard(_ cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }

    
    private func offsetX(_ cardView: CardView) -> CGFloat {
        guard isTopCard(cardView) else {
            return 0.0
        }
        return self.dragState.translation.width
    }
    
    private func offsetY(_ cardView: CardView) -> CGFloat {
        guard isTopCard(cardView) else {
            return 0.0
        }
        return self.dragState.translation.height
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView) ? 1 : 0)
                        .offset(x: offsetX(cardView), y: offsetY(cardView))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .scaleEffect(
                            self.dragState.isDragging && self.isTopCard(cardView) ? 0.85 : 1.0
                        )
                        .rotationEffect(
                            self.isTopCard(cardView) ? Angle(degrees: Double(self.dragState.translation.width / 12)) : .zero
                        )
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                        )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
