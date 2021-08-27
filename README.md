# MarvellApp

* Used [MarvelAPI](https://developer.marvel.com/documentation/getting_started)
* import SwiftUI, Combine, CryptoKit, SDWebImageSwiftUI, WebKit

#### To eliminate the "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection" error it is necessary to:
1. Opened Project target's info.plist file.
2. Added a Key called AppTransportSecurity as a Dictionary.
3. Added a Subkey called AllowsArbitraryLoads as Boolean and set its value to YES.

![alt tag](https://github.com/rustam66637/MarvellApp/blob/main/marvelapp.gif)
