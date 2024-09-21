import SwiftUI
import FirebaseFirestore

struct FavoriteProducts: View {
    
    @FirestoreQuery(collectionPath: "shop", predicates: [.isEqualTo("favorite", true)]) private var items: [Product]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            ScrollView {
                if items.isEmpty {
                    NofavoriteProduct()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                } else {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 1), content: {
                        ForEach(items) { item in
                            NavigationLink  {
                                DetailView(product: item)
                            } label: {
                                ProductCard(product: item)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .padding(.bottom, 70)
                            }
                        }
                    })
                }
            }
        }
            
        
        // MARK: - Navigation Bar
            .navigationTitle("Избранное")
    }
}

#Preview {
    FavoriteProducts()
}
