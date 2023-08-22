import Foundation

public class Greeter {
    private let provider: GreetingProvider
    
    public init(provider: GreetingProvider = .init()) {
        self.provider = provider
    }
    
    public func greet() {
        print(provider.getGreeting())
    }
}
