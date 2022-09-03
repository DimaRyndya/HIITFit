import SwiftUI
import AVKit

struct ExersiceView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    @State private var showSuccess = false
    @State private var timerDone = false
    @State private var showTimer = false
    @EnvironmentObject var history: HistoryStore


    let index: Int

    var startExerciseButton: some View {
      RaisedButton(buttonText: "Start Exercise") {
        showTimer.toggle()
      }
    }

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    var historyButton: some View {
        Button(
            action: { showHistory = true
        }, label: {
            Text("History")
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        })
            .padding(.bottom, 10)
            .buttonStyle(EmbossedButtonStyle())
    }


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
                HStack(spacing: 150) {
                    startExerciseButton
                    Button(NSLocalizedString(
                            "Done",
                            comment: "mark as finished")) {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)

                        timerDone = false
                        showTimer.toggle()

                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }
                    .disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                if showTimer {
                    TimerView(timerDone: $timerDone)
                }
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                historyButton
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

struct ExersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExersiceView(selectedTab: .constant(0), index: 0)
            .environmentObject(HistoryStore())
    }
}


