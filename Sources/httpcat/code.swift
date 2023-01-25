//
//  code.swift
//  
//
//  Created by Henrik Christensen  on 25/01/2023.
//

import ArgumentParser

struct Code: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "code",
        abstract: "Translate a http status code to text."
    )
    
    @Argument(help: "The status code to translate to text.")
    var code: Int
    
    mutating func run() {
    }
}
