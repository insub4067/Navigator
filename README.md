# Navigator

> You can you SwiftUI View with UINavigationController very easily with UIKit based Project.


## ✔️ Example

### Config and Start
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
        if inject Navigator
        
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

### Push
```swift
var navigator: Navigator?
navigator.push {
    DesinationView()
}
```

### Present
```swift
var navigator: Navigator?
navigator.present {
    DesinationView()
}
```

### BottomSheet
```swift
var navigator: Navigator?
navigator.bottomSheet {
    DesinationView()
}
```

### Alert
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

### ActionSheet
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
