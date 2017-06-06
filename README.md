# TechLadies Pre-Bootcamp Ruby Workshop 2017

Materials for the TechLadies Pre-Bootcamp Ruby Workshop 2017, covering CLI basics, Ruby basics, and how to build a simple HTTP server connected to a database.

## Overview

There are three main components of this workshop. We will cover:

* Using the Command line Interface (CLI) with Bash
  - Basic navigation
  - Pipes and Redirection
  - Reading manpages
  - Using `curl`
* Ruby Basics
  - data types and variables
  - control flow
  - functions
  - arrays and hashes
  - classes and object oriented programming (OOP)
* Building a Simple HTTP Server
  - Using the standard library and gems
  - Reading documentation
  - Serving static files
  - RESTful URL routing
  - Using a relational database
  - Using an ORM

I am attempting to cover a lot of breadth in a single workshop, but to minimize "just blindly follow the instructor" programming I will alternate the hands-on sections with a brief 'lecture' on the concepts behind them.

## Setup

The following has been gratefully borrowed from [the setup instructions for the HTML/CSS workshop](https://github.com/TechLadies/guess-the-number-sinatra). Note that if you have already set up your Github and Cloud9 accounts, you can skip some of the steps (just look at the "On Github" and "On Cloud9" sections). I'm just leaving everything in for completeness.

### On GitHub
1. Sign up for a GitHub account [here](https://github.com).
2. Once that is done, come back to this page. On this page, fork this repo by clicking the Fork button in the top right corner (ask for help if you can't find it).
3. Leave this window open as you will need to perform further set up actions to integrate smoothly with Cloud9.

### Setting up SSH between Github and Cloud9
4. You should receive an email notifying you to sign up for an account on Cloud9. If you do not have one, please alert us at the workshop.
5. Go to https://c9.io/ to sign up for a Cloud9 account by clicking on the GitHub icon in the top right corner. You will need to authorize Cloud9 to use your Github account.
6. Once it's done, you will be at the Dashboard page.
7. Go to `https://c9.io/account/ssh` to access your SSH Settings page.
8. Open another window and go to `https://github.com/settings/keys` to access your SSH and GPG keys on Github.
9. Click on the green New SSH key button in the top right corner.
10. Enter "Cloud9 IDE" in the Title field.
11. Switch back to the SSH Settings page in the previous window and copy everything in the grey box. Paste the contents in the Key field on your SSH and GPG keys page on Github.
12. Click on the green Add SSH key button.

### On Cloud9
13. Click on Create New Workspace.
14. Enter a name for your workspace and a brief description.
15. Fill in `git@github.com:<YOUR_USER_NAME>/guess-the-number-sinatra.git` in the field Clone from Git or Mercurial URL (optional). This is the repository that you forked to your own account in the earlier steps.
16. Select Ruby for the Choose a template option.
17. Click on the green Create Workspace button to proceed.
18. You should see a loading window, and this may take a while, so keep the window open and let it run. Please try this at home.
19. When things are set up, you should see your workspace, with a file manager in the left column, a text editor taking up most of the space in the main right area and a smaller terminal in the bottom of the right area.

After you're done with this, continue to the next section to figure out where all the files you'll need are laid out.

## Where's the Stuff
