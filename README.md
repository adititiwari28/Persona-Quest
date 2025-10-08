# Persona-Quest

A playful and expressive personality quiz web app built with **Java Spring Boot**, **JSP**, and **JDBC**. Personality Quest guides users through a one-question-at-a-time quiz and shows a fun personality result based on their choices.

---

## 🌟 Highlights

* **One-question-at-a-time flow** with smooth animated transitions.
* **Dynamic result page** with emojis, fade-in effects, and randomized backgrounds.
* **Admin panel included** — full CRUD for managing quiz questions (add / edit / delete / reorder).
* **Unlimited retakes** — users can retake the quiz as many times as they want (session resets on retake).
* **No results persisted by default** — result calculation runs on the backend without mandatory database storage (optional saving is possible).
* **Modular JSP structure** with reusable fragments and scoped CSS.

---

## 🛠️ Tech Stack

* Java Spring Boot
* JSP + JSTL
* JDBC + MySQL
* HTML, CSS, JavaScript
* Servlet session management

---

## 🔁 How it works (quick flow)

1. **Home (`cHome.jsp`)** — user lands and clicks **Begin the Quiz**.
2. **Start Quiz (`/startQuiz`)** — session state is reset and user is redirected to the quiz flow.
3. **Quiz (`quiz.jsp`)** — one question shown at a time; selected answers are stored in the session as `{ qid -> selectedOption }`.
4. **Admin Panel** — accessible from the app's admin section (see controller mappings or config for the exact path); admins can manage the question bank.
5. **Result Calculation (`/result`)** — backend logic tallies answers and maps counts to personality types.
6. **Retake** — user presses **Retake** which clears the session answers and restarts the quiz.

---

## ⚙️ Setup & Run

1. **Clone the repo**

```bash
git clone https://github.com/adititiwari28/Persona-Quest.git
cd Persona-Quest
```

2. **Configure MySQL connection**

Edit `src/main/resources/application.properties` with your DB credentials (url, username, password).

3. **Create the database and `questions` table** (example schema — adjust to your app's model):

```sql
CREATE DATABASE personality_quest;
USE personality_quest;

CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  qtext VARCHAR(1000) NOT NULL,
  opta VARCHAR(255) NOT NULL,
  optb VARCHAR(255) NOT NULL,
  optc VARCHAR(255) NOT NULL,
);

-- example insert
INSERT INTO questions (question_text, option_a, option_b, option_c, meta_tag)
VALUES ('Which environment energizes you most?', 'Quiet park', 'Lively party', 'Coffee shop', 'social');
```

> Note: This is a sample schema. Use the schema your app's DAO/Repository expects or examine the SQL scripts in `resources` if provided.

4. **Run the app**

```bash
mvn spring-boot:run
# or
./mvnw spring-boot:run
```

5. **Open in browser**

Visit `http://localhost:8080/quizapp/` (adjust context path if different).

---

## 🔐 Admin Panel

* The project includes an **Admin panel** (already implemented) for managing the quiz question bank (create / update / delete / reorder questions).
* Check your controller mappings or the project README/controller code to find the exact admin URL (common patterns: `/admin`, `/admin/questions`, or protected admin routes). If you want, I can open the project files and point to the exact mapping.

---

## ♻️ Retake Behavior

* Retakes are unlimited. When a user chooses **Retake**, the session-stored answers are cleared and the quiz restarts from the first question.

---


## 👩‍💻 Author

Built with ❤️ by **ADITI** — backend developer focused on scalable web apps and expressive UI.

---
