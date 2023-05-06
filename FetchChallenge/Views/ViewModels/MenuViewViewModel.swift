import Foundation
import Combine

class MenuViewViewModel: ObservableObject {
    private static let dessetMenuItems = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

    static let menuTitle = "Dessert Menu"

    @Published var menuItems: [MenuItem] = []
    @Published var error: String? = nil

    init() {
        let items = MenuItemCache.shared.getItems()
        if  !items.isEmpty {
            DispatchQueue.main.async { self.menuItems = items }
        } else {
            makeRequest()
        }
    }

    private func makeRequest() {
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

            if let items = menuResponse?.meals {
                MenuItemCache.shared.setItems(items: items)
                DispatchQueue.main.async { self.menuItems = items }
            }
        }
        RequestManager.makeRequest(request: request)
    }
}
