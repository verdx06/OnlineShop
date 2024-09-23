//
//  TabView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 21.09.2024.
//

import SwiftUI

struct TabView: View {
    
    @State private var selection: String = "home"
    
    var body: some View {
        HStack {
            TabViewHome
            TabViewFavorite
            TabViewSetting
        }
    }
}

extension TabView {
    
    var TabViewHome: some View {
        VStack {
            Image(systemName: "house")
            Text("Home")
        }
    }
    
    var TabViewFavorite: some View {
        VStack {
            Image(systemName: "heart")
            Text("heart")
        }
    }
    
    var TabViewSetting: some View {
        VStack {
            Image(systemName: "trash")
            Text("trash")
        }
    }
    
}

#Preview {
    TabView()
}
