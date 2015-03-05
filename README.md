# Committen Rails
[![Circle CI](https://circleci.com/gh/trayo/committen_rails.svg?style=svg)](https://circleci.com/gh/trayo/committen_rails)
[![Code Climate](https://codeclimate.com/github/trayo/committen_rails/badges/gpa.svg)](https://codeclimate.com/github/trayo/committen_rails)
[![Test Coverage](https://codeclimate.com/github/trayo/committen_rails/badges/coverage.svg)](https://codeclimate.com/github/trayo/committen_rails)

This repository is the host of the server side, Rails app that works in conjuction with [the ember side Committen app](https://github.com/trayo/committen_ember). 
This app serves as an API endpoint that Ember will fetch and store it's data.

Created by: [Chandra Carney](https://github.com/chandracarney), [Sam Kuhlmann](https://github.com/skuhlmann) and [Travis Yoder](https://github.com/trayo)

## Requirements

* Ruby 2.2.0

* Rails 4.2.0

## Installation

* Clone the repo:  
`$ git clone https://github.com/trayo/committen_rails.git`

* Change into the new directory:  
`$ cd committen_rails`

* Bundle install:  
`$ bundle install`

* Set up the database:  
`$ rake db:setup`

## Running the tests

* Run the tests with rspec:  
`$ rspec`

* Run the tests with rake:  
`$ rake`

## Development

* Run the server in your console:  
`$ rails server`

* Visit the app at [http://localhost:3000](http://localhost:3000) to see the splash page.
