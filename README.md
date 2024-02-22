# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 3.0.5

* Rails version: 7.0.8

* Database: POSTGRES

Step for install

* For configuration this: 
1. git clone https://github.com/Pooja-95/course-tutor-api.git

2. bundle install for installing dependencies

3. rails db:create, rails db:migrate, rails db:seed

4. For create a course & its tutors 
Using Postman
Endpoint: post base_url/courses
Body: 
course[name]: 
course[description]:
course[tutors_attributes][0][name]:
course[tutors_attributes][0][bio]:
course[tutors_attributes][1][name]:
course[tutors_attributes][1][bio]:

5. For list all the courses along with their tutors

Endpoint: get base_url/courses