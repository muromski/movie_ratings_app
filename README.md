# Movie Rating Web Application

### Objective:

Create a simple web application that allows users to browse movies, rate them, and add comments, using Ruby on Rails 7, Rails Turbo, Stimulus JavaScript, and Bootstrap 5.

### Requirements:

- **Movie Database:**
There should be a list of movies in the database. Each movie should at least have the following attributes: title, director, release year, and genre. For simplicity, these can be pre-filled with data. An admin interface for adding more movies is a nice-to-have but not required.
- **Rating and Reviewing:**
Users should be able to rate movies on a scale of 1 to 5.
Users should also be able to write a brief review/comment about a movie.
Users should only be able to review or rate a movie once, but they can update their rating or review.
- **Live Streaming:** Use Rails Turbo's live streaming feature to update movie ratings in real-time, reflecting changes as soon as a user submits a new rating.
- **Stimulus JS:** Utilize Stimulus for any required interactive elements. For instance, consider using Stimulus when a user rates a movie or submits a review, showing instant feedback before the server processes the update.
- **Views:** The application should have the following views styled using Bootstrap 5:
  - **Home/Index View:** Display a list of all movies. Each entry should display its title, director, release year, genre, average rating, and a link/button to its individual Movie Detail page.
  - **Movie Detail View:** Show all details of a movie, including all user reviews. This page should allow logged-in users to rate the movie and write/edit their review.
  - **User Profile View:** Show a user's details and a list of their reviews and ratings.

- **Extra Credit (If time permits):**
Add a basic search function to find movies by title or director. Utilize Stimulus to enhance user interaction with these features.


### Setup
1. Clone the repo `git clone git@github.com:muromski/movie_ratings_app.git`
2. Configure `database.yml` file according to your credentials
3. Run services `postgresql` and `redis` on your device
4. Run `bundle install`
5. Run `rails db:create db:migrate db:seed`
6. Run `yarn install`
7. Start app via `bin/dev`

