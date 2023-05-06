import Foundation

protocol ModelCache<T>{
    associatedtype T
    func add(item: T)
    func get(itemId: String) -> T?
    func clearCache()
    func remove(itemId: String)
}
