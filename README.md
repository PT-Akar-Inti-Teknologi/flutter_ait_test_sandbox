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

---

# Mocking

Mocking is a technique used in unit testing to simulate the behavior of an object or function.

It involves creating a fake object or function that can replace the real one during testing.

In Flutter, Mocking is commonly used to simulate network requests and other external dependencies.

The goal of mocking is to isolate the code being tested from external dependencies,

making the tests more reliable and repeatable.

---

# Setup Test

1. Setup
   In Flutter testing, setUp is a function that runs before each test,
   allowing for the creation and initialization of objects that are necessary for the execution of tests.
   It is used to set up the environment for each test, like initializing mock objects and providing test data.
   the setUp function runs once before all the tests in a test file.
   This function is used to set up the environment for all tests in that file,
   like initializing variables and opening connections to external services.

- There are several benefits to using setUp in flutter test:

  - It reduces the amount of code duplication, as the code that needs to be executed before all tests can be written once in the setUp function.
  - It ensures that the environment is set up consistently before all tests, reducing the chance of errors or inconsistent test results.
  - It makes it easier to change the environment for all tests at once, as the changes can be made in the setUp function instead of in each individual test.

2. SetupAll
   In Flutter testing, setUpAll is a function that allows you to run a specific setup code once before all the tests in a group or at the top level.
