import SwiftUI

struct ExersiceView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    var body: some View {
        VStack {
            VStack {
                Text(exerciseNames[index])
                    .font(.largeTitle)
                HStack {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                    Image(systemName: "4.circle")
                }
                .font(.title2)
            }
            Text("Video Player")
            Text("Timer")
            Text("Start/Done button")
            Text("Rating")
            Text("History button")
        }
    }
}

struct ExersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExersiceView(index: 0)
    }
}
