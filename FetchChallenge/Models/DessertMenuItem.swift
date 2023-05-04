import Foundation
import UIKit

struct MenuItem: Identifiable, Decodable {
    let title: String
    let imgUrl: String
    let id: String

    func getImage() -> UIImage? {
        if let url = URL(string: imgUrl), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return UIImage(systemName: "birthday.cake")
    }

    enum CodingKeys: String, CodingKey{
        case title = "strMeal"
        case imgUrl = "strMealThumb"
        case id = "idMeal"
    }
}


struct MenuResponse: Decodable {
    let meals: [MenuItem]
}
