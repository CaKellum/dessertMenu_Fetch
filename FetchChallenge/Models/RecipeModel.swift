import Foundation

/// This is a model that holds the information for the recipie
struct Recipe: Decodable {
    
    let id: String
    let title: String
    let imageURL: String?
    let ingredients: [IngredientSet]
    let instructions: String
    let drinkParing: String?
    let sourceUrl: String?
    let ytUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case drinkParing = "strDrinkAlternate"
        case instruction = "strInstructions"
        case imageURL = "strMealThumb"
        case sourceUrl = "strSource"
        case ytURL = "strYoutube"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strIngredient16 = "strIngredient16"
        case strIngredient17 = "strIngredient17"
        case strIngredient18 = "strIngredient18"
        case strIngredient19 = "strIngredient19"
        case strIngredient20 = "strIngredient20"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.instructions = try container.decode(String.self, forKey: .instruction)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        self.drinkParing = try? container.decode(String.self, forKey: .drinkParing)
        self.sourceUrl = try? container.decode(String.self, forKey: .sourceUrl)
        self.ytUrl = try? container.decode(String.self, forKey: .ytURL)
        let strIngredient1 = try container.decode(String.self, forKey: .strIngredient1)
        let strIngredient2 = try container.decode(String.self, forKey: .strIngredient2)
        let strIngredient3 = try container.decode(String.self, forKey: .strIngredient3)
        let strIngredient4 = try container.decode(String.self, forKey: .strIngredient4)
        let strIngredient5 = try container.decode(String.self, forKey: .strIngredient5)
        let strIngredient6 = try container.decode(String.self, forKey: .strIngredient6)
        let strIngredient7 = try container.decode(String.self, forKey: .strIngredient7)
        let strIngredient8 = try container.decode(String.self, forKey: .strIngredient8)
        let strIngredient9 = try container.decode(String.self, forKey: .strIngredient9)
        let strIngredient10 = try container.decode(String.self, forKey: .strIngredient10)
        let strIngredient11 = try container.decode(String.self, forKey: .strIngredient11)
        let strIngredient12 = try container.decode(String.self, forKey: .strIngredient12)
        let strIngredient13 = try container.decode(String.self, forKey: .strIngredient13)
        let strIngredient14 = try container.decode(String.self, forKey: .strIngredient14)
        let strIngredient15 = try container.decode(String.self, forKey: .strIngredient15)
        let strIngredient16 = try container.decode(String.self, forKey: .strIngredient16)
        let strIngredient17 = try container.decode(String.self, forKey: .strIngredient17)
        let strIngredient18 = try container.decode(String.self, forKey: .strIngredient18)
        let strIngredient19 = try container.decode(String.self, forKey: .strIngredient19)
        let strIngredient20 = try container.decode(String.self, forKey: .strIngredient20)
        let strMeasure1 = try container.decode(String.self, forKey: .strMeasure1)
        let strMeasure2 = try container.decode(String.self, forKey: .strMeasure2)
        let strMeasure3 = try container.decode(String.self, forKey: .strMeasure3)
        let strMeasure4 = try container.decode(String.self, forKey: .strMeasure4)
        let strMeasure5 = try container.decode(String.self, forKey: .strMeasure5)
        let strMeasure6 = try container.decode(String.self, forKey: .strMeasure6)
        let strMeasure7 = try container.decode(String.self, forKey: .strMeasure7)
        let strMeasure8 = try container.decode(String.self, forKey: .strMeasure8)
        let strMeasure9 = try container.decode(String.self, forKey: .strMeasure9)
        let strMeasure10 = try container.decode(String.self, forKey: .strMeasure10)
        let strMeasure11 = try container.decode(String.self, forKey: .strMeasure11)
        let strMeasure12 = try container.decode(String.self, forKey: .strMeasure12)
        let strMeasure13 = try container.decode(String.self, forKey: .strMeasure13)
        let strMeasure14 = try container.decode(String.self, forKey: .strMeasure14)
        let strMeasure15 = try container.decode(String.self, forKey: .strMeasure15)
        let strMeasure16 = try container.decode(String.self, forKey: .strMeasure16)
        let strMeasure17 = try container.decode(String.self, forKey: .strMeasure17)
        let strMeasure18 = try container.decode(String.self, forKey: .strMeasure18)
        let strMeasure19 = try container.decode(String.self, forKey: .strMeasure19)
        let strMeasure20 = try container.decode(String.self, forKey: .strMeasure20)
        // This puts the ingredents in the list and removes any blank ones
        let listedIngedients = [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
                                strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
                                strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
                                strIngredient16, strIngredient17, strIngredient18, strIngredient19,
                                strIngredient20].map({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
            .filter({!$0.isEmpty})
        // This put the measurements in the list and removes the blank ones
        let measures: [String] = [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
                                  strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
                                  strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
                                  strMeasure16, strMeasure17, strMeasure18, strMeasure19,
                                  strMeasure20].map({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
            .filter({!$0.isEmpty})

        guard listedIngedients.count == measures.count, measures.count > 0 else {
            fatalError("Error parsing ingredints list")
        }
        self.ingredients = Array(zip(listedIngedients, measures)).map({ (ingredient, measure) in
            return IngredientSet(ingredient: ingredient, measure: measure)
        })
    }
}

/// This is a easily listable data structure
struct IngredientSet: Identifiable {
    let id: UUID = UUID()
    let ingredient: String
    let measure: String
}

/// This deals with the wrapper around the data
struct RecipeResponse: Decodable {
    let meals: [Recipe]
}
