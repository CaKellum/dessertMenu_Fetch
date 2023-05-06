import SwiftUI

@main
struct FetchChallengeApp: App {

    @Environment(\.scenePhase) var appPhase

    var body: some Scene {
        return WindowGroup {
            NavigationStack {
                ContentView()
            }.onChange(of: appPhase) { currentPhase in
                if currentPhase == .background {
                    RecipeCache.shared.clearCache()
                    MenuItemCache.shared.clearCache()
                }
            }
        }
    }
}
