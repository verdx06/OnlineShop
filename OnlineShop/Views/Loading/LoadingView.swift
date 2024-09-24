//
//  LoadingView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 25.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct LoadingView: View {
    
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment (\.presentationMode) var presentation
    
    @State var rotation: Double = 0
    @State var line: CGFloat = 4
    @State var color: Color = .gray
    @State var opacity: Double = 0.3
    @State var isDone: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                
                
                Circle()
                    .stroke(lineWidth: 4)
                    .opacity(opacity)
                    .foregroundColor(color)
                Circle()
                    .trim(from: 0.3, to: 0.5)
                    .stroke(lineWidth: line)
                    .rotationEffect(.degrees(rotation))
                    .animation(.linear.repeatForever(autoreverses: false), value: rotation)
                    .onAppear {
                        self.rotation = 360
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.color = .black
                            self.line = 0
                            self.opacity = 1
                            self.isDone = 1
                            allClear()
                        }
                    }
                VStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(isDone)
                    Text("Готово!")
                        .font(.headline)
                        .opacity(isDone)
                }
                .transition(.identity)
                
            }
            .frame(width: 150)
            NavigationLink {
                ContentView()
            } label: {
                Text("Вернуться назад")
                    .frame(width: 180, height: 55)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Capsule())
                
            }
            .opacity(isDone)
            .padding(.top)
            
        } .navigationBarBackButtonHidden(true)
    }
    
    func allClear() {
        for item in items {
            viewModel.deleteProdutInCart(product: item)
        }
    }
    
}

#Preview {
    
    LoadingView()
}
