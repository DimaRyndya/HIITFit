import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
        WelcomeView()
        ForEach(0 ..< Exercise.exercises.count) { number in
            ExersiceView(index: number)
        }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
