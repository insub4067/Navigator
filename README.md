# Navigator

> You can you SwiftUI View with UINavigationController very easily with UIKit based Project.


```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let navigator = Navigator()
        navigator.start { ContentView() }

        // if inject Navigator
        /*
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
