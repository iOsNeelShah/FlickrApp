//
//  DetailScreen.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailScreen: View {
    let model: FlickrImage
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                WebImage(url: URL(string: model.media["m"] ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
                    .padding()
                
                
                Text(model.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                if !model.description.isEmpty {
                    AttributedTextView(htmlText: model.description)
                        .padding(.bottom, 8)
                } else {
                    Text("No description available")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                }
                
                Text("Author: \(model.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                
                Text("Published on: \(formattedDate(model.published))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)
                
                Spacer()
            }
            .navigationTitle("Image Detail")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Close") {
                DispatchQueue.main.async {
                    presentationMode.wrappedValue.dismiss()
                }
            }.foregroundStyle(.white))
        }
    }
    
    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            return formatter.string(from: date)
        } else {
            return dateString // Return the original string if the date format doesn't match
        }
    }
}

#Preview {
    DetailScreen(model: FlickrImage(title: "Hello", link: "https://www.flickr.com/photos/70887249@N02/53701256588/", media: ["m": "https://live.staticflickr.com/65535/53701256588_f7b01d3e47_m.jpg"], description: " <p><a href=\"https://www.flickr.com/people/127275815@N02/\">pacocorrias</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/127275815@N02/49414790686/\" title=\"INVASIONI BARBARICHE OLIENA 2020\"><img src=\"https://live.staticflickr.com/65535/49414790686_01a7619ef3_m.jpg\" width=\"190\" height=\"240\" alt=\"INVASIONI BARBARICHE OLIENA 2020\" /></a></p> <p>Su Porcu di Ottana (NU)</p> ", author: "nobody@flickr.com (\"en-ri\")", published: "2024-05-05T22:31:43Z", author_id: "70887249@N02", tags: "porcu nero bianco torino wall muro graffiti writing calligrafia parco dora"))
}
