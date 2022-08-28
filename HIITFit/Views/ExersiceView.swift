import SwiftUI

struct ExersiceView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    var body: some View {
        Text(exerciseNames[index])
    }
}

struct ExersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExersiceView(index: 0)
    }
}
