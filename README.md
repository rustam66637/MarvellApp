# MarvellApp


To eliminate the "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection" error it is necessary to:
Opened Project target's info.plist file.
Added a Key called AppTransportSecurity as a Dictionary.
Added a Subkey called AllowsArbitraryLoads as Boolean and set its value to YES.
