Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## La Coloc

La Coloc is a web application (with a mobile format) that helps you organize the sharing of housework between roommates.
This project was an end of bootcamp project. We worked as a team of three but we all implemented features related to front end development (HTML erb, CSS with tailwind, JavaScript libraries) and related to back-end development (ruby). We used Heroku to deploy the app, with a PostgreSQL database and we used cloudinary to host pictures to be displayed in the app.

## Get started

You can create you own household at **www.lacoloc.xyz**, add your roomates, rank your preferences for recurrent tasks and let the algorithm assign the tasks to you and your roomates depending on you accumulated time of work and your preferences. Once you complete a task, validate it and take a picture that will be displayed in the history. Look at the statistics and even add expenses for the household.

## Specs

### Algorithm

The algorithm starts by getting the two roommates of the flat that have worked the least. If the difference in total working time between these two is under 20 minutes then it looks at their preferences and assigns the recurrent task to the roommates that ranked it higher. If the difference is above 20 minutes then it assigns the task to the person that has worked the least ... *No time for slacking*
It runs as a background job every friday at midnight but you can still assign particular task at any moment during the week.

### Statistics

How do you win points and become the best roomie ?
By completing tasks and it's even better if the duration of said task is long.
