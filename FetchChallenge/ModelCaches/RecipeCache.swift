import Foundation
import UIKit

class RecipeCache: ModelCache {

    static let shared = RecipeCache()

    private var cachedRecipe = [Recipe]()

    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.clearCache),
                                               name: UIApplication.didReceiveMemoryWarningNotification,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didReceiveMemoryWarningNotification,
                                                  object: nil)
    }

    func add(item: Recipe) {
        if !cachedRecipe.contains(where: {$0.id == item.id}) {
            cachedRecipe.append(item)
        }
    }

    func get(itemId: String) -> Recipe? {
        cachedRecipe.first(where: {$0.id == itemId})
    }

    @objc func clearCache() {
        cachedRecipe = []
    }

    func remove(itemId: String) {
        cachedRecipe.removeAll(where: {$0.id == itemId})
    }
}
