# MarvelCharacters

## About application
<p>The network manager has completely features of generics. It enables you to write flexible, reusable functions and types that can work with any type thus You can define multiple requests that avoid duplication in the service API.

There’s a special layer between the View and the Model called the ViewModel. ViewModel provides a set of interfaces, each of which represents a UI component in the View. The presenter is controlling such api calls and business logics.

Custom code (UIKit) is used instead of storyboard/xib for showing the UI design. It has a lot of benefits to using raw code for creating a UI. The first advantage is performance. Also, you can simply edit it in one place, and the change will be reflected everywhere. Everyone can deeply understand what is going on in your project UI. It's also easier to debug when some error occurs. Another advantage is reusability - if an application uses a set of elements that look the same across the application, you can create them in one place, and then use them across the whole app.</p>

## Dependency Management
***
+ Swift Package Dependencies
    - Alamofire

# Overview
***
+ Xcode 12.4
+ Supported iOS versions: 12.1+
+ Swift 5
+ Supported devices: iPhone - iPad (portrait and landscape orientation)

## Design and Implementation guidelines
***
+ All UI is developed in code using UIKit (no Xib/Storyboards).
+ Alamofire is used for network layers.
+ Implemented simple design and existing best practices of UI/UX and software design.
