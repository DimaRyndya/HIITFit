import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)
    let viewModel = HistoryViewModel()


    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { }) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                Form {
                    Section(header:
                                Text(today.formatted(as: "MMM d"))
                                .font(.headline)) {
                        ForEach(viewModel.exercise1, id: \.self) { exercise in
                            Text(exercise)
                        }
                    }
                    Section(header:
                                Text(yesterday.formatted(as: "MMM d"))
                                .font(.headline)) {
                        ForEach(viewModel.exercise2, id: \.self) { exercise in
                            Text(exercise)
                        }
                    }

                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

struct HistoryViewModel {
    let exercise1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercise2 = ["Squat", "Step Up", "Burpee"]
}
