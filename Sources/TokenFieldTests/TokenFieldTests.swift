//
//  File.swift
//  File
//
//  Created by Fabian Canas on 8/24/21.
//

import SwiftUI
import TokenField
import XCTest

struct MyToken {
    var title: String
}

// This compiling is the test
struct TestView: View {
    @State var tokens: [MyToken]
    var body: some View {
        VStack {
            TokenField($tokens, { $0.title })
        }
    }
}

/// This compiling is the test
struct TestStringsView: View {
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

class TokenFieldTests: XCTestCase {
    func testInstatiationWithStringArray() throws {
        _ = TokenField(.constant(Array<String>()))
    }
    func testInstatiationWithIntArray() throws {
        _ = TokenField(.constant(Array<Int>()), { String($0) })
    }
    func testFormsView() throws {
        _ = TestFormsView(tokens: [MyToken(title: "something")], strings: ["something else", "and more"])
    }
}
