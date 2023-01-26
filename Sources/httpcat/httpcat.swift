import ArgumentParser

@main
struct HttpCat: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "httpcat",
        abstract: "A tool to translate http status codes to text.",
        version: "1.0.0",
        subcommands: [Code.self]
    )
    
    mutating func run() {
        print(HttpCat.helpMessage())
    }
}
