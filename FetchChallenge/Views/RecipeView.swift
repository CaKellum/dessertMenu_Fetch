import SwiftUI

struct RecipeView: View {
    typealias ViewModel = RecipeViewViewModel
    @ObservedObject private var viewModel: RecipeViewViewModel

    var body: some View {
        VStack {
            if viewModel.error == nil {
                HStack {
                    LoadingImageView(frame: (50, 50), cornerRadius: 15,
                                     url: viewModel.recipe?.getImageURL())
                    Text(verbatim: viewModel.recipe?.title ?? "").font(.title)
                }
            }
            List {
                if viewModel.error == nil {
                    Text(ViewModel.ingredientsHeading).font(.headline)
                    ForEach(viewModel.recipe?.ingredients ?? []) { ingredientSet in
                        HStack {
                            Text(verbatim: ingredientSet.ingredient)
                            Spacer()
                            Text(verbatim: ingredientSet.measure)
                        }
                    }

                    (Text(ViewModel.instructionsPrefix).bold().font(.headline) +
                     Text(viewModel.recipe?.instructions ?? ""))
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)).scrollDisabled(false)
                    if let ytUrl = viewModel.ytUrl {
                        Text(ytUrl).padding(viewModel.urlPadding)
                    }
                    if let sourecUrl = viewModel.sourceUrl {
                        Text(sourecUrl).padding(viewModel.urlPadding)
                    }
                } else if viewModel.recipe == nil {
                    ProgressView()
                } else {
                    Text(verbatim: RequestManager.defaultErrorMessage)
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
