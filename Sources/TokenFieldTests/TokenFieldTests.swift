//
//  File.swift
//  File
//
//  Created by Fabian Canas on 8/24/21.
//

import SwiftUI
import TokenField

struct MyToken: Identifiable {
    var title: String
    var id: UUID
}

struct TestView: View {
    @State var tokens: [MyToken]
    var body: some View {
        VStack {
            TokenField($tokens, { $0.title })
        }
    }
}

/// A `RandomAccessCollection` of `Identifiable` that's also a
/// `StringProtocol`, a can be used as the tokens for tokens.

extension String: Identifiable {
    public var id: String { self }
}

struct TestIdentifiableStringsView: View {
    @State var tokens: [String]
    var body: some View {
        VStack {
            TokenField($tokens)
        }
    }
}

struct TestFormsView: View {
    @State var tokens: [MyToken]
    @State var strings: [String]
    var body: some View {
        Form {
            FormTokenField(title:"Tokens", $tokens, { $0.title })
            FormTokenField({ Text("Tokens") }, $strings)
        }
    }
}
