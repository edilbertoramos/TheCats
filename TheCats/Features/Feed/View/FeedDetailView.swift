//
//  FeedDetailView.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FeedDetailView: View {
    var data: FeedDetailData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: data.imageUrl)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(maxHeight: 300)
                        .clipped()
                        .cornerRadius(15)
                        .shadow(radius: 10)
                } placeholder: {
                    Color
                        .gray
                        .opacity(0.1)
                        .frame(height: 300)
                        .cornerRadius(15)
                        .overlay {
                            ProgressView()
                        }
                }
                
                Text(data.temperament)
                    .font(.body)
                    .italic()
                    .foregroundColor(.secondary)
                
                Divider()
                
                Group {
                    FieldDetailInfoRow(title: "Life Span", value: data.lifeSpan)
                    FieldDetailInfoRow(title: "Origin", value: data.origin)
                    FieldDetailInfoRow(title: "Weight", value: data.weight)
                    FieldDetailInfoRow(title: "Hypoallergenic", value: data.hypoallergenic == 1 ? "Yes" : "No")
                }
                
                Divider()
                
                Text("About \(data.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(data.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineSpacing(6)
                
                Link("Learn more on Wikipedia", destination: URL(string: data.wikipediaURL)!)
                    .foregroundColor(.blue)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(data.name)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(UIColor.systemGroupedBackground))
        .toolbarRole(.editor)
    }
}

#Preview {
    FeedDetailView(
        data: FeedDetailData.createMock()
    )
}
