About Project
---
This app was developed to improve my knowledge of Swift and UIKit. In this app, I learned how to get data from an endpoint in Swift, handle the data, organize it in classes, and display it in a View. I also learned more about arrays, Views, Controllers, and the MVC pattern used by UIKit. Additionally, I explored Auto Layout, trailing constraints, and clipping to ensure the UI is responsive and visually appealing. I learned how to randomly sort arrays. I used this to make sure the questions appear in different orders each time the user starts the quiz.

Requirements
---
- macOS
- Xcode (latest version)
- Swift 5

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
![Iniciar Quiz](https://github.com/aduartee/quizDev/assets/103082913/efb15c6a-00cb-4a66-8343-97ea94d70da5)

Question View
---
![Iniciar Quiz](https://github.com/aduartee/quizDev/assets/103082913/3968a003-8ff5-474c-842c-00af288cf265)

Correct Response View
---
![IMG_5460](https://github.com/aduartee/quizDev/assets/103082913/68699ccd-997b-40b8-a72c-03711a63a6d6)

Wrong Response
---
![IMG_5464](https://github.com/aduartee/quizDev/assets/103082913/d7feaca7-ab8c-445e-a836-ab0af003255a)

Ranking View (Score above 50%)
---
![Parabéns por](https://github.com/aduartee/quizDev/assets/103082913/624d0e4e-6479-4d5c-bcd5-f4183792586b)

Ranking View (Score bellow 50%)
---
![Parabéns por](https://github.com/aduartee/quizDev/assets/103082913/2aacd0e0-aefe-49e3-8526-96e5f3f6a711)




