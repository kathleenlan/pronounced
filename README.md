# Pronounced

Pronounced is a pronunciation crowd-sourcing platform. Users can listen
to other users' audio recordings of pronunciations of words and phrases (
"Pronounceables") in a given language and also upload their own recordings.
While services such as Google Translate provide pronunciations of words in numerous
languages, they usually only provide one person's pronunciation. Given the
diversity of accents that exist for languages such as English, it can sometimes
be difficult for a non-native speaker of the language to gain a comprehensive
understanding of how different native speakers pronounce certain words. The goal
of Pronounced is to provide a platform where multiple users' pronunciations
can be aggregated to provide a more complete understanding of how
a Pronounceable may sound.

## Ruby version

This application is developed against Ruby 2.3.1.

## System dependencies

You will need to install ImageMagick, which is a dependency of the paperclip gem.

## Getting started

* Create a `database.yml` and populate it with the appropriate credentials.

`cp config/database.yml.example config/database.yml`

## Test Suite

The test suite can be run by running `bundle exec rake` on the command line in the project directory.

## TODO

* Add abuse reporting system
  - add authorization/restrict report filing to logged in users
  - prettify abuse report form
  - improve UX for abuse report submission

* Add rating system for users to evaluate the accuracy of pronunciations
* Implement authorization
* Format displayed datetimes
* Extract error messages to localization file
