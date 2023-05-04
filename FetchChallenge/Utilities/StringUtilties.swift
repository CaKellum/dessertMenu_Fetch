import Foundation

extension String? {
    func isNilOrEmpty() -> Bool { return self?.isEmpty ?? true }
}
