//
//  ColorGroups.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/11/22.
//

import Foundation

struct ColorGroups{
    //Standard Colors
    static let adaptableColorsGroup = ColorGroup(name: "Adaptable colors", colors: [
        Color(name: "systemRed", uiColor: .systemRed),
        Color(name: "systemBrown", uiColor: .systemBrown),
        Color(name: "systemOrange", uiColor: .systemOrange),
        Color(name: "systemYellow", uiColor: .systemYellow),
        Color(name: "systemGreen", uiColor: .systemGreen),
        Color(name: "systemMint", uiColor: .systemMint),
        Color(name: "systemTeal", uiColor: .systemTeal),
        Color(name: "systemCyan", uiColor: .systemCyan),
        Color(name: "systemBlue", uiColor: .systemBlue),
        Color(name: "systemIndigo", uiColor: .systemIndigo),
        Color(name: "systemPurple", uiColor: .systemPurple),
        Color(name: "systemPink", uiColor: .systemPink),
    ])
    static let adaptableGraysGroup = ColorGroup(name: "Adaptable grays", colors: [
        Color(name: "systemGray", uiColor: .systemGray),
        Color(name: "systemGray2", uiColor: .systemGray2),
        Color(name: "systemGray3", uiColor: .systemGray3),
        Color(name: "systemGray4", uiColor: .systemGray4),
        Color(name: "systemGray5", uiColor: .systemGray5),
        Color(name: "systemGray6", uiColor: .systemGray6)
    ])
    static let fixedColorsGroup = ColorGroup(name: "Fixed colors", colors: [
        Color(name: "red", uiColor: .red),
        Color(name: "brown", uiColor: .brown),
        Color(name: "orange", uiColor: .orange),
        Color(name: "yellow", uiColor: .yellow),
        Color(name: "green", uiColor: .green),
        Color(name: "cyan", uiColor: .cyan),
        Color(name: "blue", uiColor: .blue),
        Color(name: "purple", uiColor: .purple),
        Color(name: "magenta", uiColor: .magenta),
        Color(name: "lightGray", uiColor: .lightGray),
        Color(name: "gray", uiColor: .gray),
        Color(name: "darkGray", uiColor: .darkGray),
        Color(name: "black", uiColor: .black),
        Color(name: "white", uiColor: .white),
        
    ])
    
    //UI Element Colors
    static let labelColorsGroup = ColorGroup(name: "Label colors", colors: [
        Color(name: "label", uiColor: .label),
        Color(name: "secondaryLabel", uiColor: .secondaryLabel),
        Color(name: "tertiaryLabel", uiColor: .tertiaryLabel),
        Color(name: "quaternaryLabel", uiColor: .quaternaryLabel)
    ])
    static let fillColorsGroup = ColorGroup(name: "Fill colors", colors: [
        Color(name: "systemFill", uiColor: .systemFill),
        Color(name: "secondarySystemFill", uiColor: .secondarySystemFill),
        Color(name: "tertiarySystemFill", uiColor: .tertiarySystemFill),
        Color(name: "quaternarySystemFill", uiColor: .quaternarySystemFill)
    ])
    static let textColorsGroup = ColorGroup(name: "Text colors", colors: [
        Color(name: "placeholderText", uiColor: .placeholderText)
    ])
    static let tintColorsGroup = ColorGroup(name: "Tint colors", colors: [
        Color(name: "tintColor", uiColor: .tintColor)
    ])
    static let standardContentBackgroundColorsGroup = ColorGroup(name: "Standard content background colors", colors: [
        Color(name: "systemBackground", uiColor: .systemBackground),
        Color(name: "secondarySystemBackground", uiColor: .secondarySystemBackground),
        Color(name: "tertiarySystemBackground", uiColor: .tertiarySystemBackground)
    ])
    static let groupedContentBackgroundColorsGroup = ColorGroup(name: "Grouped content background colors", colors: [
        Color(name: "systemGroupedBackground", uiColor: .systemGroupedBackground),
        Color(name: "secondarySystemGroupedBackground", uiColor: .secondarySystemGroupedBackground),
        Color(name: "tertiarySystemGroupedBackground", uiColor: .tertiarySystemGroupedBackground)
    ])
    static let separatorColorsGroup = ColorGroup(name: "Separator colors", colors: [
        Color(name: "separator", uiColor: .separator),
        Color(name: "opaqueSeparator", uiColor: .opaqueSeparator)
    ])
    static let linkColorsGroup = ColorGroup(name: "Link colors", colors: [
        Color(name: "link", uiColor: .link)
    ])
    static let nonadaptableColorsGroup = ColorGroup(name: "Nonadaptable colors", colors: [
        Color(name: "darkText", uiColor: .darkText),
        Color(name: "lightText", uiColor: .lightText)
    ])
}
