//
//  ImageCell.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCell: View {
    let model: FlickrImage
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: model.media["m"] ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(model.title)
                .font(.caption)
                .lineLimit(1)
                .frame(maxWidth: 100)
        }
    }
}
