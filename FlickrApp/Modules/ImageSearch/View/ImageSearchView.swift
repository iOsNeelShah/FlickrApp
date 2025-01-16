//
//  ContentView.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import SwiftUI

struct ImageSearchView: View {
    
    @StateObject var viewModel = ImageSearchViewModel(apiService: FlickrAPIService())
    @State private var searchText: String = ""
    @State private var selectedImage: FlickrImage? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                    .onChange(of: searchText) { newText in
                        viewModel.searchImages(for: newText)
                    }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                    
                    Spacer()
                } else {
                    if viewModel.showError {
                        Text("Something went wrong! Please try again")
                    } else if viewModel.images?.isEmpty ?? true && searchText.count > 0 {
                        Text("No images found")
                    } else {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 16) {
                                ForEach(viewModel.images ?? [], id: \.id) { image in
                                    ImageCell(model: image)
                                        .onTapGesture {
                                            selectedImage = image
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Flickr Search")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedImage) { data in
                DetailScreen(model: data)
            }
        }
    }
}

#Preview {
    ImageSearchView()
}
