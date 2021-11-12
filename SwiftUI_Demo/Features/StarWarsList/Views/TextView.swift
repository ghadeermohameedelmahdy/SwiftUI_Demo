//
//  TextView.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import SwiftUI

struct TextView: View {
    var title: String
    var body: some View {
        Section {
            Spacer()
            Text(title)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(title: "texts")
    }
}
