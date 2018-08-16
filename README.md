[![CircleCI](https://circleci.com/gh/domiebett/ridesharing_app.svg?style=svg)](https://circleci.com/gh/domiebett/ridesharing_app)
[![Coverage Status](https://coveralls.io/repos/github/domiebett/ridesharing_app/badge.svg?branch=develop)](https://coveralls.io/github/domiebett/ridesharing_app?branch=develop)
[![Maintainability](https://api.codeclimate.com/v1/badges/d5d2ee4371e73fab5463/maintainability)](https://codeclimate.com/github/domiebett/ridesharing_app/maintainability)


# Ride Share

This is a ruby on rails project built to help individuals travelling the same route save cost
and time by joining in on a ride. It is a community sourced project that helps community through
community.

## Project details

### Introduction

This project is built on the Ruby version 2.5.1, and rails version 5.2. It makes use of the
javascript packages bootstrap-datepicker to for date select fields, jquery-timepicker for time
select fields, and google maps javascript api to help with form autocomplete for location fields.

### Project requirements

To run this project locally, you need to have the following packages installed:

* Ruby: Preferably version 2.5.1. On mac os, this call be installed by `brew install ruby`.
* Rails: You can install gems by running the `gem install rails` command.
* Node: This gives you ability to run javascript within the application. It can be done by `brew install nodejs`
* Yarn: This will help with javascript files installation. Can be installed by `brew install yarn`
* Postgres: This application will be using the postgres database, however, you can always use a 
database of your choice.
* Git: This will help you with cloning this application and contributing to it. Installed by `brew install git`

Once you have the above packages, you are ready to begin setting up this project on your local machine.

### Setting up and configuration.

First you need to clone this project from github. Go to a preferable folder on your pc to begin.
Note, all commands that begin with a `$` are to be run on the terminal without the `$` symbol.

Run:
> $ git clone https://github.com/domiebett/ridesharing_app

> $ cd ridesharing_app

After this, you need to install dependencies required by the program. To do this, run:
> $ bundle install

You also need to install javascript dependencies used in the application:
> $ yarn install

The above should give your application all the dependencies it needs to be up and running.

### Database creation.

As mentioned earlier, this application uses the postgres database by default. However, if you wish
to use another database, you can, with minor changes in the `config/database.yml` file and
include it loader gem within your gems. For now, we'll continue with the postgres installation.

First, you need to create the database. You can do this running the command:
> $ bin/rails db:create

Then you need to migrate your database to create database tables:
> $ bin/rails db:migrate

### Testing application

To run the application tests, you can simply run the command:
> $ bin/rails test

This will run tests for your application.

### Running application.

To run the application and view its functionality, run:

> $ bin/rails server

Your server will be started on your `localhost`, on port `3000`, if that port is free. After this,
you can open up your browser and enter the link `http://localhost:3000` to run the application.

If you localhost isn't set on your pc, then use the link `http://127.0.0.1:3000` to access the
application.

## Author
Dominic Bett (@domiebett).
