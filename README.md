# hat-starter-app-ios

A simple application showcasing how you can work with the `HAT` in a
mobile app, including log in and sign up. The purpose of the app is to showcase
log in, registration and simple read/write operations. Also you can use it to
build on it your own application

## Getting Started

You can start by either downloading the project or cloning it.

### Prerequisites

```
Swift 5+
Xcode 11+
```

Note: Although not tested, `Xcode 10` should also work without any problems

### Installing

This project is using `cocoapods`, in case you are not aware what `cocoapods` does
go [here](https://guides.cocoapods.org/using/getting-started.html)

Start by installing `cocoapods`, you can skip this step if you already have it:

```
$ sudo gem install cocoapods
```

Navigate to the project's root folder and install the dependecies

```
$ pod install
```

Last step is to create a new `Property List` named `Config` and add a single property named `dbUrl`. That property is a type of `String` and it has to be your endpoint to check for existing HATs in your service. If you don't do that the app will crash upon Log in

That's it, you can now build and run the application

## License

Copyright (C) 2019 Dataswift Ltd

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/
