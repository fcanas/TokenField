//
//  FormTokenField.swift
//  FormTokenField
//
//  Created by Fabian Canas on 7/6/21.
//

import SwiftUI

/// A token field with a label appropriate for use in a `Form`
public struct FormTokenField<Data, Label> : View where Data: RandomAccessCollection, Label: View {
    
    @Binding private var data: Data

    private var label: Label

    private var conversion: (Data.Element) -> String

    /// Creates a Token Field with a `ViewBuilder` for its `Form` label
    public init(@ViewBuilder _ label: () -> Label, _ data: Binding<Data>, _ tokenConversion: @escaping (Data.Element) -> String) {
        self.label = label()
        conversion = tokenConversion
        _data = data
    }
    
    public var body: some View {
        HStack {
            label
            TokenField($data, conversion)
                .alignmentGuide(.controlAlignment) { $0[.leading] }
        }
        .alignmentGuide(.leading) { $0[.controlAlignment] }
    }
}

public extension FormTokenField where Data.Element: StringProtocol {
    /// Creates a Token Field of `StringProtocol` tokens with a `ViewBuilder` for its `Form` label
    init(@ViewBuilder _ label: () -> Label, _ data: Binding<Data>) {
        self.label = label()
        conversion = { String($0) }
        _data = data
    }
}

public extension FormTokenField where Label == Text, Data.Element: StringProtocol, Data.Element: Identifiable {
    /// Creates a Token Field of `StringProtocol` tokens with a text label generated from a title string.
    init<S>(title: S, _ data: Binding<Data>) where S: StringProtocol {
        label = Text(title)
        conversion = { String($0) }
        _data = data
    }
}

public extension FormTokenField where Label == Text {
    /// Creates a Token Field with a text label generated from a title string.
    init<S>(title: S, _ data: Binding<Data>, _ tokenConversion: @escaping (Data.Element) -> String) where S: StringProtocol {
        label = Text(title)
        _data = data
        conversion = tokenConversion
    }
}

// Horizontal alignment enabling interaction with Form labels
// https://developer.apple.com/forums/thread/126268
extension HorizontalAlignment {
    private enum ControlAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[HorizontalAlignment.center]
        }
    }
    internal static let controlAlignment = HorizontalAlignment(ControlAlignment.self)
}
