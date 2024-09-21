import SwiftUI

struct ProductViewForCart: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let product: Product
    
    var body: some View {
        
        ZStack {
            
            Rectangle
            
            
            HStack {
                
                if let url  = URL(string: product.image) {
                    CardImageView(
                        url: url,
                        width: 100,
                        height: 100
                    )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    TitleAndXmark
                    
                    RemoteControl
                    
                } 
                
                Spacer()
            }
        } .padding(.horizontal)
    }
}


#Preview {
    ProductViewForCart(product: .dum)
        .environmentObject(ViewModel())
}
