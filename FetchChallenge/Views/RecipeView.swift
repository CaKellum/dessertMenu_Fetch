import SwiftUI

struct RecipeView: View {
    typealias ViewModel = RecipeViewViewModel
    @ObservedObject private var viewModel: RecipeViewViewModel

    var body: some View {
        Text("Hello")
    }

    init(id: String) {
        self.viewModel = RecipeViewViewModel(with: id)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(id: "53049")
    }
}
