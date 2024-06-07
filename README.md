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
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/95274b5b-8dac-4a5e-8d03-a3d221cb71fc">

Question View
---
<img width="379" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/463d04a4-528d-4172-89e7-0a5bf8421145">

Correct Response View
---
<img width="379" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/4bae347d-f58b-4e6e-b7b5-0bf7adb351cb">

Wrong Response
---
<img width="379" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/23a87ffa-969b-47be-a004-6f8413bea907">

Ranking View (Score above 50%)
---
<img width="379" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/95861f59-564e-44dc-b9f2-5467feb9f474">

Ranking View (Score bellow 50%)
---
<img width="379" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/6497f13c-d235-4ad3-bb7f-db7f9a756bde">




