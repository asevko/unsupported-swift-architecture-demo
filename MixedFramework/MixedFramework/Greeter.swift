import Foundation
import GoogleMobileAds

public class Greeter {
    private let provider: GreetingProvider
    private let mobielAds: GADMobileAds
    
    public init(provider: GreetingProvider = .init(), mobielAds: GADMobileAds = .sharedInstance()) {
        self.provider = provider
        self.mobielAds = mobielAds
    }
    
    public func greet() {
        print(provider.getGreeting())
        print("Installed Ads version is \(mobielAds.sdkVersion)")
    }
}
