//
//  AtributtedTextView.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import SwiftUI
import UIKit

struct AttributedTextView: UIViewRepresentable {
    let htmlText: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.backgroundColor = .clear
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        if let data = htmlText.data(using: .utf8) {
            do {
                let attributedString = try NSAttributedString(
                    data: data,
                    options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                    documentAttributes: nil
                )
                textView.attributedText = attributedString
            } catch {
                print("Error rendering HTML: \(error)")
            }
        }
    }
}
