import Foundation
import Combine

class RecipeViewViewModel: ObservableObject {

    private static let idKey = ":id"
    private static let urlToGetRecipe = "https://themealdb.com/api/json/v1/1/lookup.php?i=:id"

    @Published var recipe: Recipe? = nil
    @Published var error: String? = nil

    init(with mealId: String){
        if let recipe = RecipeCache.shared.get(itemId: mealId) {
            DispatchQueue.main.async { self.recipe = recipe }
        } else {
            makeRequest(for: mealId)
        }
    }

    private func makeRequest(for id: String) {
        guard let url = URL(string: Self.urlToGetRecipe.replacingOccurrences(of: Self.idKey, with: id)) else {
            return
        }
        let request: Request = Request(url: url) { recipeData, urlResponse, error in
            guard let recipeData = recipeData else {
                if let error = error {
                    self.error = RequestManager.getErrorDescripton(error: error, response: urlResponse)
                } else {
                    self.error = RequestManager.defaultErrorMessage
                }
                return
            }
            let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: recipeData)

            if let recipe = recipeResponse?.meals.first {
                DispatchQueue.main.async { self.recipe = recipe }
                RecipeCache.shared.add(item: recipe)
            }
        }
        RequestManager.makeRequest(request: request)
    }

}
