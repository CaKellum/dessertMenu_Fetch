import Foundation

class MenuItemCache: ModelCache {

    static let shared = MenuItemCache()

    private var cachedMenuItems = [MenuItem]()

    private init() {}

    func add(item: MenuItem) {
        if !cachedMenuItems.contains(where: {$0.id == item.id}) {
            cachedMenuItems.append(item)
        }
    }

    func get(itemId: String) -> MenuItem? {
        cachedMenuItems.first(where: {$0.id == itemId})
    }

    func clearCache() {
        cachedMenuItems = []
    }

    func remove(itemId: String) {
        cachedMenuItems.removeAll(where: {$0.id == itemId})
    }

    func getItems() -> [MenuItem] {
        cachedMenuItems
    }

    func setItems(items: [MenuItem]) {
        items.forEach({self.add(item: $0)})
    }
}
