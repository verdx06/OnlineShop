import SwiftUI

struct MapView: View {
    
    let map: Map
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 5)
                .frame(height: 250)
                .foregroundColor(.gray.opacity(0.5))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .frame(height: 50)
                .offset(y: -65)
                .foregroundColor(.white)
            
            VStack {
                
                HStack {
                    
                    Text(formatPhoneNumber(number: "\(map.numbers)"))
                        .padding(.horizontal)
                        .font(.system(size: 25))
                        .offset(x: -45 ,y: -43)
                }
                
                Text(map.name)
                
                Text("\(map.cod)")
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
            formattedNumber += chunk + " "
        }
        
        return formattedNumber.trimmingCharacters(in: .whitespaces)
    }
}


#Preview {
    MapView(map: .fakemap)
}
