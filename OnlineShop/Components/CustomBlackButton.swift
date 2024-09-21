import SwiftUI

struct CustomBlackButton: View {
    
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 65)
                .bold()
                .foregroundColor(.white)
                .background(Color.black)
                .clipShape(Capsule())
        }
    }
}
