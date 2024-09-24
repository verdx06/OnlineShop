import SwiftUI

struct CustomBlackButton: View {
    
    let title: String
    let action: () -> ()
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: width)
                .frame(height: height)
                .bold()
                .foregroundColor(.white)
                .background(Color.black)
                .clipShape(Capsule())
        }
    }
}
