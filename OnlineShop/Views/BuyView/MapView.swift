import SwiftUI
import FirebaseFirestore

struct MapView: View {
    
    let map: Map
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: "map") private var items: [Map]
    
    var body: some View {
        ZStack {
            Button  {
                isToggle()
            } label: {
                if map.asChoise {
                    ZStack(alignment: .topLeading) {
                        maps
                        Image(systemName: "circle.fill")
                    }
                    
                }
                else {
                    ZStack(alignment: .topLeading) {
                        maps
                        Image(systemName: "circle")
                    }
                }
            }
        }
    }
    
    func formatPhoneNumber(number: String) -> String {
        var formattedNumber = ""
        
        let chunkSize = 4
        for i in stride(from: 0, to: number.count, by: chunkSize) {
            let start = number.index(number.startIndex, offsetBy: i)
            let end = number.index(start, offsetBy: chunkSize, limitedBy: number.endIndex) ?? number.endIndex
            let chunk = String(number[start..<end])
            formattedNumber += chunk + " ****"
            return formattedNumber.trimmingCharacters(in: .whitespaces)
        }
        
        return "Error"
    }
    
    func isToggle() {
        for item in items {
            viewModel.setMapChoice(map: item, choice: false)
        }
        viewModel.setMapChoice(map: map, choice: true)
    }
}


extension MapView {
    var maps: some View {
        ZStack(alignment: .topLeading)  {
            VStack(alignment: .leading) {
                Text(map.name)
                    .foregroundColor(.white)
                    .font(.system(size: 19))
                    .fontWeight(.semibold)
                
                Spacer()
                
                HStack{
                    Text(formatPhoneNumber(number: "\(map.numbers)"))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()
            
            
        }
        .frame(width: 242, height: 153)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .shadow(color: .accentColor.opacity(0.2), radius: 5, x: 4, y: 4)
        .padding()
    }
}

#Preview {
    MapView(map: .fakemap)
        .environmentObject(ViewModel())
}
