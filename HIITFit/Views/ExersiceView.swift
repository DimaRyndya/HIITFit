import SwiftUI
import AVKit

struct ExersiceView: View {
    @Binding var selectedTab: Int

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let interval: TimeInterval = 30
    let index: Int
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
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
                HStack(spacing: 150) {
                    Button(NSLocalizedString(
                            "Start Exercise",
                            comment: "begin exercise")) { }
                    Button(NSLocalizedString(
                            "Done",
                            comment: "mark as finished")) {
                        selectedTab = lastExercise ? 9 : selectedTab + 1
                    }
                }
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
        ExersiceView(selectedTab: .constant(1), index: 0)
    }
}


