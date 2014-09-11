|     Project | Information                                                                          |
|------------:|:-------------------------------------------------------------------------------------|
| Domain:     | [Coding Dojo](http://codingdojo.com) (cd)                                            |
| Topic:      | Ruby on Rails (ror) <br> Understanding Rails - Controllers and Views (03controller)  |
| Assignment: | Random Word Generator (03random)                                                     |
| Repository: | cd-ror-03controller-03random                                                         |

~~~

===============
#1: Start project
===============

# Create new project
rails new random-word-generator

# Change to new directory
cd random-word-generator


===============
#2: Update Gemfile
===============

URL: https://github.com/josevalim/rails-footnotes
Rails footnotes displays footnotes in your application for easy debugging, 
such as sessions, request parameters, cookies, filter chain, routes, 
queries, etc.

edit> Gemfile
  - Uncomment: gem 'bcrypt-ruby', '~> 3.1.2'      # Using bcrypt (3.1.7)
  - Add: gem 'hirb'                               # Using hirb (0.7.2)
  - Add: gem 'rails-footnotes', '>= 4.0.0', '<5'  # Installing rails-footnotes (4.0.1)

bundle install

rails generate rails_footnotes:install


===============
#3: Create controllers
===============

# Default RESTful Routing Controllers
# rails g controller <project-name> index new create show edit update destroy 

# Controllers needed for this project
rails g controller Generator generate reset


===============
#4: Create models/tables
===============

NA


===============
#5: edit: app/assets/stylesheets/generator.css.scss
===============

*{
    font-family: sans-serif;
}

h1{
    font-size: 20px;    
}

#holder{
    border: 1px solid black;
    text-align: center; 
    margin: 20px auto;
    background-color: orange;
    width: 400px;
    padding-bottom: 15px;
}

#randbox{
    border: 1px solid black;
    width: 200px;
    text-align: center;
    margin: 0px auto 20px;
    background-color: lightgreen;
}

===============
#6: edit: app/controllers/generator_controller.rb
===============

class GeneratorController < ApplicationController

  def generate
    if session[:count]
        session[:count] += 1
    else
        session[:count] = 1
    end
    flash[:count] = session[:count]
    
    @word = Array.new(14){rand(36).to_s(36)}.join.upcase
  end

  def reset
    session.delete :count
    redirect_to('/generator/generate')
  end

end

===============
#7: edit: app/views/generator/generate.html.erb
===============

<div id='holder'>
    <h1>Random Word (attempt #<%= flash[:count] %>)</h1>

    <div id='randbox'>
        <%= @word %>
    </div>
    <form action='/' method='get'>
        <input type='submit' value='Generate'>
    </form>
    <a href="/generator/reset"><input type='submit' value='Restart'></a>
</div>

===============
#8: edit: config/routes.rb
===============

RandomWordGenerator::Application.routes.draw do
  get "generator/generate"
  get "generator/reset"

  #resources :generator

  root 'generator#generate'
end

===============
#9: Start server 
===============

rails server


===============
#10: Load application in browser
===============

http://localhost:3000

~~~


