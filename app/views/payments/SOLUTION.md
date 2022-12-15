## Problem:
Users are getting 504 timeout errors when they are opening the payments page

### Potential diagnosis:
- This is largely happening as the frontend is:
  1. Looping over every project to create a list of dates
  2. Looping over every date/project to apply logic to determine if an applicant has payments due
    - This also has a nested loop over every applicant
  3. Querying the database again for finding the associated project name

- This means the database is constantly being queried for each applicant/date and it makes the process extremely slow
- In addition, this is logic that shouldn't necessarily be determined in the frontend (the frontend should be concerned with rendering data from the backend and conditional logic should be concerned in regards to user interaction with the web app)


## Potential solutions:
1. Creating a Projects table that is generated through an SQL stored procedure:
  - The table would have foreign keys to projects, and generate a timestamp based on the project date
  - The stored procedure can perform the logic to determine whether or not a project has payments due from certain applicants, and populate a column based on the same logic implemented on the frontend
  - This procedure can be run either when:
    1. Changes are made to the applicant, project, funds tables (preferred, but can be excessive work on the database)
    2. At certain intervals throughout the day with a cronjob
    3. When the payments data is queried/requested (least favourable)
  - This way, the frontend can be concerned with one thing only: rendering the table generated in the backend
  - This can instead be implemented through applying the logic through the controllers for applicants and projects, whenever an applicant status is edited or project linked is changed/added
2. Creating procedures/functions in the project model
  - If we don't want to create a new table, two things we can do with the models are:
    1. Creating a procedure in the Projects model to get projects sorted by date, so this isn't handled in the ERB
    2. Creating a procedure in the Projects model to get applicants for each project, that follows the logic for determining if an applicant owes any payments
  - This will be faster than querying the Projects twice in the frontend, once to get the dates and another to match applicants that fit criteria to a project
  - This concept is implemented in the project file in this PR