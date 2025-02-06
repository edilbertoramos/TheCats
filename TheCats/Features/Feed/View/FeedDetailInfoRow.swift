//
//  FeedDetailInfoRow.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FieldDetailInfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value)
                .font(.body)
                .fontWeight(.medium)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    FieldDetailInfoRow(
        title: "Title",
        value: "Detail"
    )
}


