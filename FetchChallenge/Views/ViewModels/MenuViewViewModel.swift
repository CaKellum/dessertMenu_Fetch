import Foundation
import Combine

class MenuViewViewModel: ObservableObject {
    static let dessetMenuItems = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    @Published var menuItems: [MenuItem] = []
    @Published var error: String? = nil

    init() {
        guard let url = URL(string: Self.dessetMenuItems) else {return}
        let request = Request(url: url) { menuData, urlResponse, error in
            guard let menuData = menuData else {
                if let error = error {
                    self.error = RequestManager.getErrorDescripton(error: error, response: urlResponse)
                } else {
                    self.error = RequestManager.defaultErrorMessage
                }
                return
            }
            let menuResponse = try? JSONDecoder().decode(MenuResponse.self, from: menuData)
            DispatchQueue.main.async { self.menuItems = menuResponse?.meals ?? [] }
        }
        RequestManager.makeRequest(request: request)
    }
}
