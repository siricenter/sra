@annotation:file Gemfile
#The place to define gem dependencies
The `Gemfile` is where you define your application's Gem dependencies. Gems are just libraries written in Ruby. Look at the file and 
see how gems are specified.

@annotation:file app/controllers/application_controller.rb
#The application controller
The `Application Controller` is the superclass for all your controllers. If there is any functionality you want included in all
controllers, you can either put it here or write a Ruby Gem.

@annotation:tour 
Welcome to SRA! Our application is built using **Ruby on Rails**, a framework for developing web applications that **emphasizes developer productivity over performance**. This doesn't mean a Rails application can't scale; it simply means that the emphasis is on developer productivity.

In this tutorial, you'll watch a YouTube series on Rails development called "Riding Ruby on Rails".
You'll learn how to create your own Rails application, and should **follow along with everything that's done in the videos**. Each stage of the tutorial will also show some code from the SRA app so that you can see a real-world application of what you're learning. 

After most slides, **you'll have a small (ungraded) quiz** to make sure you understood the key points of the tutorial. Generally, these are things a Rails developer should have memorized, but there's a lot to learn, so it'll probably take some time before you memorize them all.

**Watch this short introduction to rails.** Don't worry about the part covering installing Ruby - you'l learn how to do that in the next slide. Every Codio environment has Ruby pre-installed, and the SRA project has a script to install rails, the necessary databases, and everything else we need for the application to run.

![640x480](https://www.youtube.com/watch?v=phaINNGgUnE&index=2&list=PLVBFw0Pn9e9L8f0_etdXbwjRG4cpNJ9nT)

@annotation:tour creating-application
# Creating a rails application

**Create a new Codio project of your own in a separate tab**. It should use the `empty project` template. 

In order to follow along with this tutorial, you'll have to use the terminal that comes with Codio. To access the terminal, click `Tools > Terminal` in the top menu. You'll have to install rails using the terminal. The command to do this is `gem install rails`. To install the specific version of rails we need for this tutorial, **modify that command** to `gem install rails -v 3.2.18`.

After you install rails in your project, **follow along with the instructions given in this video tutorial** on creating a rails application from the command line.

In order **to view your new application in the browswer**, click on the dropdown menu next to `Project Index (static)` up in the top menu and select `Box URL`. This will open your application in another tab. You have to have your rails server running first, but that's covered in the video.

![640x480](https://www.youtube.com/watch?v=nt76hUw1Zik)

@annotation:tour creating-application-quiz
# Application Quiz

1.	What command line command **creates a new app** called `my_app`?
1.	What command line command **starts the rails server**?
1.	What command line command **starts a rails server in the background**? (Not covered in the slide - you have to google)
1.	What directory contains most of your **application files**?


@annotation:tour gemfile
# The Gemfile
The Gemfile is where we specify which gems our application needs. It's found **in the project's root directory**.

We've made sure to put comments for every gem we're using to describe what each gem does.

Watch this tutorial on Gemfiles. When you're done, take note of which gems we're using, and which groups the various gems are in. Would you put those gems in different groups? Why or why not?

![640x480](https://www.youtube.com/watch?v=yESFok-Pa2Y)

@annotation:tour gemfile-quiz
# Gemfile quiz

1.	Where is the **Gemfile located**?
1.	**True or False**: The Gemfile is written in a language other than Ruby?
1.	What command line command **installs gem dependencies** specified in the Gemfile?
1.	What function is called in the Gemfile to **specify a gem dependency**?

@annotation:tour model-active-record-1
# Models
Models represent the "things" your application deals with. This might be users, people, interviews, or anything else that might need to be persisted to a database.

The SRA project uses two kinds of models - one for objects which are stored in SQL databases, and another kind for objects which are stored in MongoDB. This tutorial covers the SQL kind of model. Don't worry about the other kind for now.


@annotation:tour model-
# Migrations
Watch this video tutorial about generating models and migrations.

![640x480](https://www.youtube.com/watch?v=uQARCj1OmFg)


@annotation:tour cucumber-header
# Cucumber's Integration Tests
Cucumber is a tool that lets us write feature tests in plain english. Each file tests a single feature. 
These features can be broken up further into multiple scenarios.

As you can read on line 2, this particular file tests a field worker's ability to enter a household's data.
We start with a high-level description of the file in a user-story format. We format a user story this way:

		As a <type of user>
		I want to <do something>
		In order to <provide some kind of business value>
        
This particular file doesn't describe how the feature provides business value very well. How would you describe it better?

@annotation:tour cucumber-scenario-1
# Cucumber's Scenarios
A scenario is simply a way that a user could use the feature. For example, a user might be able to access a feature 
either through a settings panel or through a navigation bar. Each would be tested in a different scenario.

For this particular feature, there are two ways to access the `create household` form. 
Only one of them is tested here. (Hint: It's the `Start Form` scenario). When you have a handle on writing
Cucumber tests, please add the other test here.

@annotation:tour cucumber-scenario-2
# Cucumber's Scenarios
A scenario is made up of 3 parts:
	1.	`Given`
	2.	`When`
	3.	`Then`
    
`Given` describes preconditions for the feature. Examples would include "Given I am logged in", or "Given I own a car". 
In other words, this is the setup part of the scenario.

`When` describes the actions the user must take to use the feature. Examples include "When I visit the dashboard" or 
"When I fill out the form". In other words, this is the active part of the scenario.

`Then` describes postconditions for the feature. Examples would include "Then I should be on the dashboard", or 
"Then the interview should be saved in the database". In other words, this part of the scenario deals with the effects
of the user's actions.

If you need to have more than one thing in any of these parts, use `And`. There's an example of it in the `Start Form` scenario here.
