import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    var body: some View {
        ZStack {
            GradientBackground()
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab)
                    .tag(9)
                ForEach(0 ..< Exercise.exercises.count) { number in
                    ExersiceView(selectedTab: $selectedTab, index: number)
                        .tag(number)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
