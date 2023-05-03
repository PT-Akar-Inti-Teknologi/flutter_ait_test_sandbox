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

- some_packages
  - lib
    - src
      - domain
        - repository
          - repository1.dart
          - repository2.dart
      - presentation
        - page
          - page1.dart
          - page2.dart
  - test
    - src
      - domain
        - repository
          - repository1_test.dart
          - repository2_test.dart
      - presentation
        - page
          - page1_test.dart
          - page2_test.dart

---

# How to Create Test File easily

- ctrl+shift+p
- click dart:go to test/implementation files
- create hotkeys

---

# How to Run test

- Run Nearest

  - ctrl+shift+p
  - Test:run Test at cursor
  - create hotkeys

- Run File

  - ctrl+shift+p
  - Test:run Tests in current file
  - create hotkeys

- Run Package

  - melos test
  - select desired package to run test

- Run all
  - melos1 test:all
