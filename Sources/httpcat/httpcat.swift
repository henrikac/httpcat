import ArgumentParser
import Foundation

@main
struct HttpCat: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "httpcat",
        abstract: "A tool to translate http status codes to text.",
        version: "1.0.0",
        subcommands: [Code.self]
    )
    
    @Flag(help: "Opens http.cat")
    var open = false
    
    mutating func run() throws {
        if open {
            let url = "https://http.cat/"
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
            print(HttpCat.helpMessage())
        }
    }
}
