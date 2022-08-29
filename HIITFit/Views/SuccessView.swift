import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("""
                        Good job completing all four exercise!
                        Remember tomorrow's another day.
                        So eat well and get some rest.
                        """)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Button("Continue") {}
                    .padding()
            }

        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
       SuccessView()
    }
}
