//
//  StickyCategoryBarContainerView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 26.07.2025.
//

import SwiftUI

struct StickyCategoryBarContainer: View {
    @ObservedObject var presenter: Presenter
    @Binding var isPinned: Bool
    
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: BarOffsetKey.self, value: geo.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        
        StickyCategoryBar(presenter: presenter)
            .padding(.vertical, 4)
    }
}

struct BarOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
