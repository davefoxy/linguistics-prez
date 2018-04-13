import Foundation

let input = "Hello, my name's David and I'm doing a presentation on NLP!"

let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
tagger.string = input

let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
let range = NSRange(location: 0, length: input.utf16.count)

var tokens = Set<String>()
tagger.enumerateTags(in: range,
                     unit: .word,
                     scheme: .lexicalClass,
                     options: options) { tag, tokenRange, stop in

                        if case .noun = tag! {
                            let token = (input as NSString).substring(with: tokenRange)
                            tokens.insert(token)
                        }
}

// tokens = ["name", "David", "presentation", "NLP"]
