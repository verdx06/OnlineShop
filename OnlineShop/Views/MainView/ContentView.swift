import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 1)) {
                    ForEach(items) { item in
                        NavigationLink  {
                            DetailView(product: item)
                        } label: {
                            ProductCard(product: item)
                                .padding(.bottom, 90)
                                .foregroundColor(.black)
                            Divider()
                        }
                    }
                }
            }
            .navigationBarItems(leading: LeadingButton, trailing: TrailingButton)
            .padding(.horizontal, 10)
                .navigationBarBackButtonHidden(true)
            // MARK: - Navigation Bar
            .navigationTitle("Товары")
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(ViewModel())
}



