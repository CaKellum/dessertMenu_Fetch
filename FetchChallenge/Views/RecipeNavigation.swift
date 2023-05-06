import SwiftUI

struct RecipeNavigation: View {

    let item: MenuItem

    var body: some View {
        NavigationLink {
            RecipeView(id: item.id)
        } label: {
            ItemView(item: item)
        }
    }
}
