# README

This README enlists the requirement and the steps needed to run this application build on Rails 7, Ruby 3, Shakapacker to manage javscript modules, Material UI for CSS and Reactjs for frontend. It use Postgresql as database and devise for basic authentication for both html and api requests.
Rspec is TODO.

Worth to note that It uses separate folder `client` to manage all react front end code.

- Ruby version

  `3.0.1`
  
  For setup from scratch, Install using `rvm`. 
  
  for rvm, visit https://rvm.io/rvm/install
  
  run the command `rvm install "ruby-3.0.1"` to install the required version of ruby.

- Rails version

  `7.0.1`
  
  Needs bundler > version 2, 
  
  Try `gem install bundler`

- System dependencies

  Needs Ruby
  
  Bundler > 2
  
  Operating system - Tested on Ubuntu 22.04 with Chrome browser.
  
  Requires node, visit https://github.com/nvm-sh/nvm to setup node > 14 using nvm.
  
  You can also install yarn, visit https://yarnpkg.com/cli/install

- For Database creation
  `rails db:setup`

 ## How to run the application

  Clone the repo - `https://github.com/mike1011/referrals.git`
  
  `cd referrals`
  
   Assuming the system has node, rvm , bundler and yarn installed, execute the below commands and start the app.
  
  `nvm use 14`
  
  `yarn`
  
  `npm i`
  
  --create the db using `rails db:setup`
  
  Run `foreman start -f Procfile.dev`
  Hit the url - `http://localhost:3000/` on the browser to see the app.

  ### How to use the API's
  Needs Curl to run the commands. if curl is not present, visit https://curl.se/download.html
		
	== register API ===
	
	`curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "mike1011@gmail.com", "password": "password123" } }' http://localhost:3000/api/v1/users`

	== login API ==
	
	`curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "mike1011@gmail.com", "password": "password123" } }' http://localhost:3000/api/v1/users/sign_in`

	== logout api ==
	
	`curl -XDELETE -H "Content-Type: application/json" -d '{ "user": { "email": "mike1011@gmail.com", "password": "password123" } }' http://localhost:3000/api/v1/users/sign_out`
