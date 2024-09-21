import SwiftUI

struct NofavoriteProduct: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Нет ни одного избранного продукта!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 8)
                Text("Тебе понравилась какая-то вещь, но нет времени про нее почитать? Добавь в избранное, чтобы сделать это позже!")
                    .padding(.bottom, 20)
                NavigationLink  {
                    ContentView()
                } label: {
                    Text("Добавить первый продукт🥳")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.black)
                        .font(.headline)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        }
                }
                .padding(.horizontal, 30)
                

            }.frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NofavoriteProduct()
}
