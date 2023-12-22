# 🗺️ Navigator

> Enhance your UIKit-based project with the power of SwiftUI. This guide provides a comprehensive example of how to integrate SwiftUI views for various navigation scenarios, including push, modal presentation, bottom sheets, alerts, and action sheets. By leveraging SwiftUI's simplicity and UIKit's robustness, you can create a seamless and dynamic user experience.

## ✔️ Example Usage

### Setting Up and Starting the Navigator
Configure your `SceneDelegate` to initialize and display your SwiftUI view using a custom `Navigator` class.   
This setup ensures that your SwiftUI view is properly embedded within the UIKit environment.
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let navigator = Navigator()
        navigator.start { ContentView() }

        /*
        Optional: Inject Navigator into your ViewModel
        navigator.start {
          let viewModel = ContentViewModel(navigator: navigator)
          return ContentView(viewModel: viewModel)
        }
        */

        window?.rootViewController = navigator.view
        window?.makeKeyAndVisible()
    }
}
```

### Navigating with Push
Easily navigate to a new view using the `push` method.   
This method adds the destination view to the navigation stack.
```swift
var navigator: Navigator?
navigator.push {
    DesinationView()
}
```

### Presenting Modally
Use the `present` method to display a view modally over the current context.
```swift
var navigator: Navigator?
navigator.present {
    DesinationView()
}
```

### Displaying a Bottom Sheet
Invoke the `bottomSheet` method to present a view as a bottom sheet, a popular UI pattern in modern apps.
```swift
var navigator: Navigator?
navigator.bottomSheet {
    DesinationView()
}
```

### Showing Alerts
Easily display alerts with customizable buttons and actions.
```swift
var navigator: Navigator?
let parameter = AlertParameter(
    message: "Message",
    buttons: [
        .init(title: "default", action: { }),
        .init(title: "cancel", style: .cancel, action: { })
    ]
)
navigator.alert(parameter)
```

### Using Action Sheets
Similar to alerts, action sheets can be displayed with various options.
```swift
var navigator: Navigator?
let parameter = AlertParameter(
    message: "Message",
    buttons: [
        .init(title: "default", action: { }),
        .init(title: "cancel", style: .cancel, action: { })
    ]
)
navigator.actionSheet(parameter)
```
