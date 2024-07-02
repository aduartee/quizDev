About Project
---
This app was developed to improve my knowledge of Swift and UIKit. In this app, I learned how to get data from an endpoint in Swift, handle the data, organize it in classes, and display it in a View. I also learned more about arrays, Views, Controllers, and the MVC pattern used by UIKit. Additionally, I explored Auto Layout, trailing constraints, and clipping to ensure the UI is responsive and visually appealing. I learned how to randomly sort arrays. I used this to make sure the questions appear in different orders each time the user starts the quiz.

Requirements
---
- macOS
- Xcode (latest version)
- Swift 5
- IOS 15.6 min

Data Source
---
- The algorithm questions in this app are sourced from an external endpoint. The app consumes this endpoint to fetch the questions dynamically. Here's how it works:

- **Endpoint URL:**  https://json-questions.vercel.app/questions

### Fetching Questions:

Upon launching the app or when needed, a network request is sent to the endpoint URL using URLSession.
The response from the endpoint is received asynchronously in JSON format.
Parsing JSON:

The JSON response is decoded into an array of QuestionModel objects using JSONDecoder.
Populating Questions:

The questions retrieved from the endpoint are then populated within the app's user interface for users to access and practice.
By fetching questions dynamically from the endpoint, the app ensures that users have access to a varied and up-to-date collection of algorithmic challenges.

Initial View
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/c7293fc0-2065-448f-aecb-0d146625b4cf" width="300">

Choose the difficult
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/aa710fda-bb0f-4a7e-8e15-3c58ed13d2fa" width="300">

Question View
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/e1a58148-6f2e-4fdc-b750-3432d95a7dc2" width="300">

Correct Anwser View
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/372a7942-bacd-421f-8c88-60355fa92d0d" width="300">

Time is up
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/a7a81991-1ce0-4103-b69f-b458489fcb30" width="300">

Wrong Anwser
---
<img src="https://github.com/aduartee/quizDev/assets/103082913/71841118-4aa7-4ef7-a2b7-a0079e4b4a6e" width="300">

Ranking View
---

<p align="center">
  <img src="https://github.com/aduartee/quizDev/assets/103082913/976f184d-e027-4937-b120-877bfc86eb2a" width="200" />
  <img src="https://github.com/aduartee/quizDev/assets/103082913/2d8aedff-4aa6-4195-a591-96233983b1e9" width="200" />
  <img src="https://github.com/aduartee/quizDev/assets/103082913/387af659-f9ba-4dc7-b32f-3f753e6bf567" width="200" /> 
  <img src="https://github.com/aduartee/quizDev/assets/103082913/74ae52a0-966b-428e-a0de-ca399303c440" width="200" /> 
  <img src="https://github.com/aduartee/quizDev/assets/103082913/69ede11b-a7bc-4927-bfc1-eba941d2411c" width="200" /> 
</p>
