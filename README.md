# Getting Started

Please use these command in command line to get started:

1. `dart pub global activate melos` -> to install melos in system, make sure melos commannd can be run from command line after doing this, if not, add Pub/Cache/bin (not sure where, depends on OS and installation) to PATH env
2. `melos bootstrap` -> to run flutter pub get for all available packages
3. `melos env` -> generate .env dart code based on .env files
4. `flutter run` -> to run the app

---

# Test Packages

Some packages that we will need for our testing

1. moctail --> for Mocking class
2. bloc_test --> to help us testing flutter bloc/cubit
3. fake_async --> to help us recreate an asyncronous await

---

# Test Directory

some_packages
├── lib
│ ├── src
│ │ ├── domain
│ │ │ ├── repository
│ │ │ │ ├── repository1
│ │ │ │ └── repository2
│ │ ├── presentation
│ │ │ ├── pages1
│ │ │ └── pages2
├── test
│ ├── src
│ │ ├── domain
│ │ │ ├── repository
│ │ │ │ ├── repository1
│ │ │ │ └── repository2
│ │ ├── presentation
│ │ │ ├── pages1
│ │ │ └── pages2

---

# How to Create Test File easily

- ctrl+shift+p
- click dart:go to test/implementation files
- create hotkeys

# How to Run test
