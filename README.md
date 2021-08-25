# TokenField

A SwiftUI wrapper for `NSTokenField`

```swift
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
```

`TokenField` takes a `Binding` to a `RandomAccessCollection` of `Identifiable` 
elements to use as its tokens. It also requires a closure to convert those
elements to a `String`.

A `RandomAccessCollection` of `Identifiable` that's also a
`StringProtocol`, a can be used as the tokens for the `TokenFiels`.

```swift
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
```

`FormTokenField` can be used within a `Form` view and be given a
label that will align with standard `Form` labels.

```swift
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
```
