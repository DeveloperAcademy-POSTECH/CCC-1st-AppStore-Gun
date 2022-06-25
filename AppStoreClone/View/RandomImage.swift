//
//  RandomImage.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct RandomImage: View {
    let cornerRadius: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

struct RandomImage_Previews: PreviewProvider {
    static var previews: some View {
        RandomImage(cornerRadius: 12)
            .frame(width: 62, height: 62)
            .preferredColorScheme(.dark)
    }
}
