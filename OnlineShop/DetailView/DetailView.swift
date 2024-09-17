import SwiftUI
import FirebaseFirestore

struct DetailView: View {
    
    let product: Product
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    @EnvironmentObject var viewModel: ViewModel
    @State var isAlert: Bool = false
    let widthImage: CGFloat = UIScreen.main.bounds.width
    let heightImage: CGFloat = UIScreen.main.bounds.height / 1.5
    
    var body: some View {
        
        ZStack (alignment: .topLeading){
            VStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: widthImage, height: heightImage)
                        .ignoresSafeArea()
                        .shadow(color: .black, radius: 10)
                    
                }
                
                NamePriceDescription
                
                detailViewWithProduct
                
            }
            .navigationBarBackButtonHidden(true)
            BackButtonView()
                .padding(.leading)
        }
    }
    
    func checkCount() -> Bool {
        if let id = product.id {
            for item in items {
                if item.count ?? 0 >= 1, item.id == id {
                    return true
                }
            }
            return false
        }
        return false
    }

    
}




#Preview {
    DetailView(product: .dum)
        .environmentObject(ViewModel())
}
