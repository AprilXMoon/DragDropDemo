//
//  TeaItemView.swift
//  DragAndDrop
//
//  Created by April LEE on 2024/5/29.
//

import SwiftUI

struct TeaItemView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 26))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    TeaItemView(title: "Apple")
}
