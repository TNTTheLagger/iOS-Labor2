//
//  TodoItem.swift
//  MyTodo
//
//  Created by Guest User on 2026. 09. 17..
//
import SwiftUI

struct TodoItem:Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

