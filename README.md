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

## Prerequisites
Running this project requires Rails 5.2.8 and Ruby 2.7.4.

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Set up your Google OAuth 2 credentials in config/initializers/omniauth.rb. You will need to create a project in the Google Cloud Console, enable the Google OAuth 2 API, and create a client ID and client secret.
6. Run the test suite with `bundle exec rspec`
7. Start the local server by running `rails s'
8. Visit http://localhost:3000

Pull down the [Back-End repo](https://github.com/On-y-va/onyva_be). Set up instructions are in that repository's README. Do not nest this inside your front-end repository.

## Learning Goals
- API building and consumption
- Use of an external OAuth provider to authenticate users
- Implement a production-quality user interface using Bootstrap or other common CSS styling framework

This application was designed according to the project specs [here](https://backend.turing.edu/module3/projects/consultancy/).

## Screenshots

## OAuth

This app uses the Google Sign-In API and OAuth 2.0 protocol to authenticate users and retrieve their basic profile information. This information is stored to allow users to sign in and create accounts using their Google credentials. 

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
