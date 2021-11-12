//
//  StarWarsCatDetailsView.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import SwiftUI
import Kingfisher
struct SWItemDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var item: SWItemRowViewModel
    var body: some View {
        VStack(alignment: .leading, content: {
            KFImage(URL(string: item.image))
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .cornerRadius(10.0)
                .overlay(itemTitle, alignment: .bottom)
            buildTextDetails(item.birthYear)
            buildTextDetails(item.gender)
            buildTextDetails(item.hairColor)
            buildTextDetails(item.eyeColor)
            buildTextDetails(item.skinColor)
            buildTextDetails(item.mass)
            buildTextDetails(item.height)
            Spacer()
        })
        .padding(10)
    }
    var itemTitle: some View {
        ZStack {
            Text(item.title)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.black)
        .opacity(0.8)
    }
    func buildTextDetails(_ data: String) -> some View {
       return Text(data).font(.headline)
        .padding(5)
    }
}

struct StarWarsCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SWItemDetailsView(item: SWItemRowViewModel(item: StarwarsCatsResponse.Result(name: "test", image: "https://images.hdqwalls.com/download/luke-skywalker-star-wars-vu-320x240.jpg")))
    }
}
