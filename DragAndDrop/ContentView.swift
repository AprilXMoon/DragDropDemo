//
//  ContentView.swift
//  DragAndDrop
//
//  Created by April LEE on 2024/5/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var draggedItem: String?
    @State private var fruitItems = ["🫖 Tea", " ☕️ Coffee", " 🧃 Juice", "🧋Pearl milk tea", "🥛 Milk", "🍹 Fruit tea", "🧉 Mate tea", "🍵 Matcha tea"]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(fruitItems, id: \.self) { fruit in
                    TeaItemView(title: fruit)
                        .onDrag({
                            draggedItem = fruit
                            return NSItemProvider()
                        })
                        .onDrop(of: [.text], delegate: DropDrapDelegate(destinationItem: fruit, fruits: $fruitItems, draggedItem: $draggedItem))
                    
                }
            }
            .padding(.horizontal, 20)
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
