import Foundation
import Combine

class RecipeViewViewModel: ObservableObject {

    static let idKey = ":id"
    static let urlToGetRecipe = "https://themealdb.com/api/json/v1/1/lookup.php?i=:id"

    @Published var recipe: Recipe? = nil
    @Published var error: String? = nil

    init(with mealId: String){
        guard let url = URL(string: Self.urlToGetRecipe.replacingOccurrences(of: Self.idKey, with: mealId)) else {
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
            DispatchQueue.main.async { self.recipe = recipeResponse?.meals.first }
        }
        RequestManager.makeRequest(request: request)
    }

}
