## Login And Register UI
Simple UI and animation fro login dan register using flutter



https://user-images.githubusercontent.com/36830534/174746440-70a85f52-8f4a-4fd9-8d8e-db22830a5ea9.mp4



### Library
- flutter_svg
- wave
- simple_animations
- blobs
- page_transition

#### using ShapeTransition
- you need ShapeTransition.dart and ShapeTransitionController.dart
- wrap all widget inside ShapeTransition child
- call playAnimation from ShapeTransitionController
- wait animation to finish inside onFinish from ShapeTransition widget and trigger your action
