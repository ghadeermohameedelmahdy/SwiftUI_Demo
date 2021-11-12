//
//  StarWarsCatListItem.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import SwiftUI
import Kingfisher
struct SWListItem: View {
    @Environment(\.colorScheme) var colorScheme
    @State var item: SWItemRowViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            KFImage(URL(string: item.image))
                .resizing(referenceSize: CGSize(width: 120, height: 120))
                .clipShape(Rectangle())
                .cornerRadius(10.0)
                .padding(5)
            Text(item.title)
                .font(.headline)
                .padding(5)
        }).frame(height: 150, alignment: .leading)
    }
}

struct StarWarsCatListItem_Previews: PreviewProvider {
    static var previews: some View {
        SWListItem(item: SWItemRowViewModel(item: StarwarsCatsResponse.Result(name: "test", image: "https://images.hdqwalls.com/download/luke-skywalker-star-wars-vu-320x240.jpg")))
    }
}
