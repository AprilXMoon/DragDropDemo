//
//  DropDrapDelegate.swift
//  DragAndDrop
//
//  Created by April LEE on 2024/6/9.
//

import Foundation
import SwiftUI

struct DropDrapDelegate: DropDelegate {
    
    let destinationItem: String
    
    @Binding var fruits: [String]
    @Binding var draggedItem: String?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        if let draggedItem {
            let fromIndex = fruits.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = fruits.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.fruits.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
                    }
                }
            }
        }
    }
}
