import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel = MenuViewViewModel()
    var body: some View {
        VStack {
            if viewModel.error == nil {
                List(viewModel.menuItems) { item in
                    NavigationLink {
                        RecipeView(id: item.id)
                    } label: {
                        ItemView(item: item)
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            } else {
                Text(verbatim: viewModel.error ?? RequestManager.defaultErrorMessage)
            }
        }.cornerRadius(15).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
