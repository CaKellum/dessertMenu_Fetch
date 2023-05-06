import SwiftUI

struct LoadingImageView: View {
    private static let loadingText = "Loading"
    let frame: (width: CGFloat, height: CGFloat)
    let cornerRadius: CGFloat
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Image(systemName: "birthday.cake")
            } else {
                ProgressView()
            }
        }
        .frame(width: frame.width, height: frame.height)
        .cornerRadius(cornerRadius)
    }
}
