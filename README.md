# Supstacker

This is a code-along from [web-crunch](https://webcrunch.com/posts/supplement-stack-sharing-app-ruby-on-rails) to build a supplement stacker similar to [PC part-picker](https://pcpartpicker.com/). A user create a list of products, with Amazon product codes. In the background, data is parsed and the attributes added to the product. The user can then share this list with other users.

This is my first use of web-crunch's new Rails UI engine. It seems pretty cool so far. 

## Tech Stack:

* Ruby version 3.1.2 on Rails 7.0.8.1

* Devise for authentication

* Sidekiq with Active Job for background job

* Nokogiri to scrape the webpage 


<!-- * System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions -->

## Models

- "User" - The model responsible for the person who might add and share supplement stacks

- "Stack" - A collection of products a user can share

- "Product" - Gets shared inside a stack. has richer data like price, description title etc
 
- "Brand" - To add a filter later on. 1 brand per supplement

### Improvements
- can add ratings, manufacturer, etc.
