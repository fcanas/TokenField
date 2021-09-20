# TokenField

A SwiftUI wrapper for `NSTokenField`

```swift
struct MyToken {
    var title: String
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

`TokenField` takes a `Binding` to a `RandomAccessCollection` of
elements to use as its tokens. When the token type does not conform 
to `StringProtocol`, it also requires a closure to convert tokens to 
a `String`.

```swift
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
