//
//  ExtensionsForViews.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 11.09.2024.
//

import Foundation
import SwiftUI


extension ContentView {
    
     var TrailingButton: some View {
        NavigationLink(destination: CardViewForProducts()) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(Color.black)
                        .font(.title2)
                }

    }
    
     var LeadingButton: some View {
        NavigationLink(destination: FavoriteProducts()) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.black)
                        .font(.title2)
                }

    }
}
