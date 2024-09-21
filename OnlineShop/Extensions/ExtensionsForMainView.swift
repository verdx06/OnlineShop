import Foundation
import SwiftUI


extension ContentView {
    
     var TrailingButton: some View {
        NavigationLink(destination: CartView()) {
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
