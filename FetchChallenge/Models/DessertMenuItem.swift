import Foundation
import UIKit

struct MenuItem: Identifiable, Decodable {
    let title: String
    let imgUrl: String
    let id: String

    func getImageURL() -> URL? { URL(string: imgUrl) }

    enum CodingKeys: String, CodingKey{
        case title = "strMeal"
        case imgUrl = "strMealThumb"
        case id = "idMeal"
    }
}


struct MenuResponse: Decodable {
    let meals: [MenuItem]
}
