import Foundation
import SwiftUI

class RecipeViewViewModel: ObservableObject {

    private static let idKey = ":id"
    private static let urlToGetRecipe = "https://themealdb.com/api/json/v1/1/lookup.php?i=:id"

    static let instructionsPrefix = "Instructions \r\r"
    static let ingredientsHeading = "Ingredients"
    static let videoInstructions = "Video for "
    static let sourceInstructions = "Source for "

    @Published var recipe: Recipe? = nil
    @Published var error: String? = nil
    var ytUrl: AttributedString? { getLinkString(for: recipe?.ytUrl, with: Self.videoInstructions) }
    var sourceUrl: AttributedString? { getLinkString(for: recipe?.sourceUrl, with: Self.sourceInstructions) }
    var urlPadding = EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)

    init(with mealId: String){
        if let recipe = RecipeCache.shared.get(itemId: mealId) {
            DispatchQueue.main.async { self.recipe = recipe }
        } else {
            makeRequest(for: mealId)
        }
    }

    func getLinkString(for urlString: String?, with title: String) -> AttributedString? {
        guard let urlString = urlString else { return nil }
        return try? AttributedString(markdown: "\(title)[\(self.recipe?.title ?? "")](\(urlString))")
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
