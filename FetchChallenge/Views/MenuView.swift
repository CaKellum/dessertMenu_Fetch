import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel = MenuViewViewModel()
    var body: some View {
        VStack {
            if !viewModel.menuItems.isEmpty {
                    List(viewModel.menuItems) { item in
                        RecipeNavigation(item: item)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            } else if viewModel.error != nil {
                Text(verbatim: RequestManager.defaultErrorMessage)
            } else {
                ProgressView()
            }
        }.cornerRadius(15).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
