<div id="header" align="center">
<img src="src/assets/onyva_logo.png" alt="onyva logo" width="400" height="auto" />
</div>

# Onyva
<img width="670" alt="Screen Shot 2023-02-22 at 8 24 13 PM" src="https://user-images.githubusercontent.com/111713452/220821040-f3bcdb59-f940-4916-8e06-45b74dfbb9ee.png">

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-by-crips.svg)](https://forthebadge.com)

## Project Overview
Organize your upcoming travel plans with Onyva! This repo is a front-end application built on Rails. The back-end repo is available [here](https://github.com/On-y-va/onyva_be).

[Production Link](https://onyva.herokuapp.com/)

## Learning Goals
- API building and consumption
- Use of an external OAuth provider to authenticate users
- Implement a production-quality user interface using Bootstrap or other common CSS styling framework

This application was designed according to the project specs [here](https://backend.turing.edu/module3/projects/consultancy/).

## Prerequisites
Running this project requires Rails 5.2.8 and Ruby 2.7.4.

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Set up your Google OAuth 2 credentials in config/initializers/omniauth.rb. You will need to create a project in the Google Cloud Console, enable the Google OAuth 2 API, and create a client ID and client secret.
6. Run the test suite with `bundle exec rspec`
7. Pull down the [Back-End repo](https://github.com/On-y-va/onyva_be). Set up instructions are in that repository's README. Do not nest this inside your front-end repository.
8. Start the local server by running `rails s'

## Usage
To use the application, go to http://localhost:3000 in your web browser. You should see the homepage, which displays a list of your trips if you are logged in, or a login/signup form if you are not.

### User Authentication
This application uses Google OAuth 2 for user authentication. When you click the "Sign in with Google" button on the homepage, you will be prompted to log in to your Google account and authorize the application to access your basic profile information. Once you are authenticated, you will be redirected back to the application and logged in.

### Creating, Editing, and Deleting Trips
To create a new trip, click the "Create Trip" button on the homepage. You will be taken to a form where you can enter the details of your trip, such as the name, destination, and dates. Once you submit the form, your new trip will be added to the list on the homepage.

To edit a trip, visit the trip details page and click the "Update Trip" button. You will be taken to a form where you can update the trip details. Once you submit the form, the trip will be updated.

To delete a trip, visit the trip details page and click the "Delete Trip" button. You will be riderected to your home page. 

### Inviting Users
To invite a friend to your trip, click the "Invite friends" button on the trip page. You will be taken to a form where you can enter the email of the user. Once you submit the form, the trip will be added to your friends trip list where they can accept or decline the invitation.

## Screenshots


![Screen Shot 2023-03-03 at 1 33 52 PM](https://user-images.githubusercontent.com/111713452/222833644-2e914bdc-b952-4842-bd78-dcd843887ffe.png)

![Screen Shot 2023-03-03 at 1 33 58 PM](https://user-images.githubusercontent.com/111713452/222833818-5fce5064-ca1f-4a6c-9b8a-c91f907684f5.png)


![Screen Shot 2023-03-03 at 1 34 39 PM](https://user-images.githubusercontent.com/111713452/222833858-3d1aa39f-8496-4695-b1e9-b706bcc5ef87.png)

![Screen Shot 2023-03-03 at 1 34 52 PM](https://user-images.githubusercontent.com/111713452/222833887-1c4c0ca2-c295-49c9-8a1b-0d02af28d1cb.png)


## Contributors

:mortar_board: <i>All participants in this project are graduates from the Turing School of Software & Design.</i> <br> <br>
  
:woman: <b>Anhnhi Tran, PT, DPT</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/anhtran811">@anhtran811</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/anhtran8/">anhtran8</a> <br>

:woman: <b>Kaylah Rose Mitchell</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/kaylahrose">@kaylahrose</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/kaylahrose/">kaylahrose</a> <br>

:boy: <b>Matisse Mallette</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/MatisseMallette">@MatisseMallette</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/matisse-mallette/">matisse-mallette</a> <br>

:boy: <b>Braxton Eddings</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/beddings81">@beddings81</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/braxton-eddings/">braxton-eddings</a> <br>

:boy: <b>Alastair Lloyd</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/Adrlloyd">@Adrlloyd</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/adrlloyd/">adrlloyd</a> <br>

## Contributing
If you would like to contribute to the project, feel free to fork the repository and submit a pull request. Please make sure to follow the project's coding conventions and testing guidelines.
