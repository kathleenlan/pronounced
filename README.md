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

[View demo here](https://pronounced.herokuapp.com/)

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

* Add recaptcha to pronunciation upload form and user creation form
* Allow users to record pronunciations in the browser
* Allow users to specify their language skill levels/background (e.g. native
  speaker, fluent non-native speaker, beginner, etc.) in their user profile
  (This allows other users to better understand the context of the
  pronunciation.)
* Implement authorization
* Format displayed datetimes
* Extract error messages to localization file
* Allow users to see all pronunciations contributed by a user
* Allow users to see a list of their own pronunciations
* Avoid rendering disabled pronunciations?
* Paginate pronunciations on pronounceable show page
* Prettify abuse report form
* improve UX for abuse report submission

## Thoughts on various design and UX decisions

### Rating system

I have decided not to implement a rating system for users to evaluate
pronunciations. After careful consideration, I have concluded that it is useful
to listen to pronunciations from users with a diverse range in language skill
levels and backgrounds. Originally, Pronounced was conceived with the intention
of being a reference guide of pronunciations by native speakers (similar to how
online dictionaries provide pronunciation audio recordings made by native
speakers of the given language). It occured to me later on that it would be
useful to hear how non-native speakers pronounce words in a given language as
well, so that native speakers (and also other non-native speakers) can develop
a better understanding of what to listen for when speaking with non-native
speakers. In other words, learning to listen for different pronunciations is a
two-way street, and rating someone's pronunciation doesn't contribute meaningful
 to the purpose of this application.
