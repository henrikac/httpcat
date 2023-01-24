@main
public struct httpcat {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(httpcat().text)
    }
}
