import SwiftUI

struct ItemView: View {
    
    let item: MenuItem
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                LoadingImageView(frame: (50, 50), cornerRadius: 10, url: item.getImageURL())
                VStack { Text(verbatim: item.title) }
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [MenuItem(title: "Lasagna", imgUrl: "not a url", id: "1237"),
                     MenuItem(title: "Lasagna", imgUrl: "not a url", id: "1234"),
                     MenuItem(title: "Lasagna", imgUrl: "not a url", id: "1235"),
                     MenuItem(title: "Lasagna", imgUrl: "not a url", id: "1236")]
        VStack(alignment: .leading){
            ForEach(items) { item in
                ItemView(item: item)
            }
        }
    }
}
