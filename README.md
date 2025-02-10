# Studense

## Under Development

Studense is an education platform I am building to explore development with Ruby on Rails. Watch this space!

## Features

- [ ] Authentication
  - [x] only publicly expose create account and sign up
  - [ ] oauth
- [x] Accounts
  - [ ] JSON payload
- [x] Profiles
  - [ ] JSON payload
- [ ] Students
  - [ ] JSON payload
  - [x] CRUD
  - [ ] require approval
- [ ] Instructors
  - [ ] JSON payload
  - [x] CRUD
  - [ ] require approval
- [ ] Courses
  - [ ] JSON payload
  - [x] approvable
  - create
    - [x] only admin or Instructor
  - destroy
    - [ ] only admin or same Instructor
- [ ] Enrollments
  - [ ] JSON payload
  - [x] approvable
  - create
    - [x] only admin or Instructor
    - [ ] only show approved courses
    - [ ] student selector for admin users
  - destroy
    - [ ] only admin or same Instructor
- [ ] Admin Requests
  - [ ] restrict to admins
  - [ ] index to display all requests
  - [ ] approve button
  - [ ] deny button
  - [ ] email regarding the status