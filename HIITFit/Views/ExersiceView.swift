import SwiftUI
import AVKit

struct ExersiceView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let interval: TimeInterval = 30
    let index: Int
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn’t find \(Exercise.exercises[index].videoName).mp4")
                      .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 90))
                Button(NSLocalizedString(
                        "Start/Done",
                        comment: "begin exercise / mark as finished")) { }
                    .font(.title3)
                    .padding()
                RatingView()
                    .padding()
                Spacer()
                Button("History") { }
                    .padding(.bottom)
            }
        }
    }
}

struct ExersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExersiceView(index: 0)
    }
}


