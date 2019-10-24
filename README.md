#  warqLog


# Installation

Add my private Specs source on your Podfile to download warqLog library from my private repo:

You can use HTTP or SSH
```sh
source 'https://github.com/JosepEscobar/Specs.git'
```

```sh
source 'git@github.com:JosepEscobar/Specs.git'
```
Add this following line on your Podfile
```sh
pod 'warqLog'
```

# Import Logger
```swift
import warqLog
```

# Output Formats
```sh
[Date Time][Type][File][Line][Column][Method] -> [Any?]

[Date Time][Type][File][Line][Column][Method][TAG] -> [Any?]

╒═══════════ START: TAG ═══════════╕
[Date Time][Type][File][Line][Column][Method] -> [Any?]
╘════════════ END: TAG ════════════╛
```

# Usage
#### Warning
```swift
WarqLog.warning("warning message")
```
```sh
2019-10-24 07:04:58457 [⚠️WARNING][ViewController.swift]:19 26 viewDidLoad() -> warning message
```

#### Error
```swift
WarqLog.error("error message")
```
```sh
2019-10-24 07:04:58457 [‼️ERROR][ViewController.swift]:20 24 viewDidLoad() -> error message
```

#### Debug
```swift
WarqLog.debug("debug message")
```
```sh
2019-10-24 07:04:58457 [🔵DEBUG][ViewController.swift]:16 24 viewDidLoad() -> debug message
```

#### Info
```swift
WarqLog.info("info nessage")
```
```sh
2019-10-24 07:04:58457 [ℹ️INFO][ViewController.swift]:17 23 viewDidLoad() -> info nessage
```

#### Verbose
```swift
WarqLog.verbose("verbose message")
````
```sh
2019-10-24 07:04:58457 [✳️VERBOSE][ViewController.swift]:18 26 viewDidLoad() -> verbose message
```

#### Fatal Error
```swift
WarqLog.fatalError("severe message")
```
```sh
2019-10-24 07:04:58457 [🛑FATAL ERROR][ViewController.swift]:21 25 viewDidLoad() -> severe message
```
