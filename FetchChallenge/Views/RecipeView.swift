import SwiftUI

struct RecipeView: View {
    typealias ViewModel = RecipeViewViewModel
    @ObservedObject private var viewModel: RecipeViewViewModel

    var body: some View {
        VStack {
            if viewModel.error == nil {
                Text(verbatim: viewModel.recipe?.title ?? "")
                List(viewModel.recipe?.ingredients ?? []) { ingredientSet in
                    HStack {
                        Text(verbatim: ingredientSet.ingredient)
                        Text(verbatim: ingredientSet.measure)
                    }
                }
                Text(verbatim: viewModel.recipe?.instructions ?? "")
                if let urlString = viewModel.recipe?.ytUrl, let url = URL(string: urlString) {
                    Link("\(viewModel.recipe?.title ?? "") video", destination: url)
                }
                if let sourceUrlString = viewModel.recipe?.sourceUrl, let url = URL(string: sourceUrlString) {
                    Link("\(viewModel.recipe?.title ?? "") source", destination: url)
                }
            } else if viewModel.recipe == nil {
                ProgressView()
            } else {
                Text(verbatim: RequestManager.defaultErrorMessage)
            }
        }
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
