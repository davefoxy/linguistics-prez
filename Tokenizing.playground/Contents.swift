import Foundation

let input = "Let's tokenize a string!"

var tokens = [CFString]()

let allocator = kCFAllocatorDefault
let cfString = input as CFString
let tokenizer = CFStringTokenizerCreate(allocator,
                                        cfString,
                                        CFRangeMake(0, input.count),
                                        kCFStringTokenizerUnitWord,
                                        CFLocaleCopyCurrent())

// Move to the first token in the string
var result = CFStringTokenizerAdvanceToNextToken(tokenizer)

while !result.isEmpty {

    let currentRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
    let currentToken = CFStringCreateWithSubstring(allocator, cfString, currentRange)
    tokens.append(currentToken!)

    // Advance to the next token
    result = CFStringTokenizerAdvanceToNextToken(tokenizer)
}

// tokens = ["Let's", "tokenize", "a", "string!"]
