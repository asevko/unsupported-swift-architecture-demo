import SwiftUI
import MixedFramework

struct ContentView: View {
    private let provider = GreetingProvider()
    private let greeter = Greeter()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(provider.getGreeting())
        }
        .padding()
        .onAppear {
            greeter.greet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
