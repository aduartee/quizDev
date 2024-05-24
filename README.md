Data Source
---

- The algorithm questions in this app are sourced from an external endpoint. The app consumes this endpoint to fetch the questions dynamically. Here's how it works:

- **Endpoint URL:**  https://json-questions.vercel.app/questions

- The app makes a network request to the following endpoint URL:
Copy code
https://json-questions.vercel.app/questions

Fetching Questions:

Upon launching the app or when needed, a network request is sent to the endpoint URL using URLSession.
The response from the endpoint is received asynchronously in JSON format.
Parsing JSON:

The JSON response is decoded into an array of QuestionModel objects using JSONDecoder.
Populating Questions:

The questions retrieved from the endpoint are then populated within the app's user interface for users to access and practice.
By fetching questions dynamically from the endpoint, the app ensures that users have access to a varied and up-to-date collection of algorithmic challenges.

**Link for endpoint:** https://json-questions.vercel.app/questions

Initial View
---
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/95274b5b-8dac-4a5e-8d03-a3d221cb71fc">

Question View
---
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/85a14cfb-c16b-4008-b3ba-9cf0dd31b6bf">

Correct Response View
---
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/9f181e2d-cf28-4ec5-8859-c7b6f2d8882d">

Wrong Response
---
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/0ba3d0cc-5d6a-4ee3-ac08-b70c1c6f7af7">

Ranking View
---
<img width="400" alt="image" src="https://github.com/aduartee/quizDev/assets/103082913/9dbcd9fc-55cc-4177-abee-32eb09872dd0">




