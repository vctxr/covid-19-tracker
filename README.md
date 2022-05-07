# COVID-19 Tracker 🦠

iOS app to see COVID-19 statistics worldwide. It's built using the new *shiny~* ✨ `SwiftUI` framework with modern architecture ([TCA](https://github.com/pointfreeco/swift-composable-architecture)) as well as support to `Widgets` and custom `Intents`.


> **Note:** The data is from CSSEGISandData/COVID-19 transformed into a JSON file by github user pomber. ([link to the repo](https://github.com/pomber/covid19))

# 🌎 Demo
| Sort | Filter | Detail |
| - | - | - |
| <img src="/Assets/sort.gif"/> | <img src="/Assets/filter.gif"/> | <img src="/Assets/detail.gif"/> |
| Widget | Single Intent | Multiple Intent |
| <img src="/Assets/widget.gif"/> | <img src="/Assets/single-intent.gif"/> | <img src="/Assets/multiple-intent.gif"/>
| Widget Deeplink | - | - |
| <img src="/Assets/widget-deeplink.gif"/> | | |
  
  
# 🌈 Highlights
- SwiftUI + The Composable Architecture (https://github.com/pointfreeco/swift-composable-architecture)
- Widget extensions with custom intent and deeplinks!
- New Background app refresh API with operation queues
- Utilizes the new Swift Package Manager to manage remote and local dependencies
- SwiftUI + UIKit bridging for some components (Charts, SFSafariViewController)
