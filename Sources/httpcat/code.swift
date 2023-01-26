//
//  code.swift
//  
//
//  Created by Henrik Christensen  on 25/01/2023.
//

import ArgumentParser
import Foundation

struct Code: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "code",
        abstract: "Translate a http status code to text."
    )
    
    @Argument(help: "The status code to translate to text.")
    var code: Int
    
    @Flag(help: "Shows a cat image illustrating the status code on http.cat")
    var show = false
    
    mutating func run() throws {
        if let statusCode = HTTPStatusCode(rawValue: code) {
            if show {
                let url = "https://http.cat/\(statusCode.rawValue)"
                let task = Process()
                
                #if os(macOS)
                task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
                #else
                task.executableURL = URL(fileURLWithPath: "/usr/bin/xdg-open")
                #endif
                task.arguments = [url]
                
                do {
                    try task.run()
                } catch {
                    print("Error opening the browser: \(error.localizedDescription)")
                }
            } else {
                switch statusCode {
                case .ok:
                    print("200 OK")
                    break
                default:
                    print("\(statusCode.rawValue) \(HTTPURLResponse.localizedString(forStatusCode: statusCode.rawValue).capitalized)")
                }
            }
        } else {
            print("\(code) is not a valid http status code")
        }
    }
}

enum HTTPStatusCode: Int {
    // 100 Informational
    case `continue` = 100
    case switchingProtocols
    case processing
    // 200 Success
    case ok = 200
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case iMUsed = 226
    // 300 Redirection
    case multipleChoices = 300
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect
    // 400 Client Error
    case badRequest = 400
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case imATeapot
    case misdirectedRequest = 421
    case unprocessableEntity
    case locked
    case failedDependency
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451
    // 500 Server Error
    case internalServerError = 500
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended = 510
    case networkAuthenticationRequired
}
