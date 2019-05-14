# Photogram SIGNIN

In this project, we'll be working with the same old domain model:

![Domain Model](erd.png?raw=true "Domain Model")

In this project, our starting point is the [target of the last project, Photogram WRITE](https://photogram-write-target.herokuapp.com/). Our goal is to add the very tool you need to your toolkit: allowing users to _sign in_ so that you can tailor the experience for them, rather than showing every visitor the exact same thing.

### Here is [our new target](http://photogram-signin-target.herokuapp.com/).

[https://photogram-signin-target.herokuapp.com/](https://photogram-signin-target.herokuapp.com/)

## Setup

 1. From [your Cloud9 repositories list](https://c9.io/account/repos), set up a workspace [as usual](https://guides.firstdraft.com/starting-on-a-project-in-cloud9).
 1. Set up the project: `bin/setup`
 1. Start the web server by clicking "Run Project".
 1. Run `rails dummy:reset` to pre-populate your tables with some dummy development data.
 1. As you work, remember to navigate to `/git` and **always be committing**.

> Note that if for some reason later you want to reset the database again, you need to first destroy it:
>
> ```bash
> rails db:drop
> ```
>
> and then re-create and re-populate it:
>
> ```bash
> rails db:migrate
> rails dummy:reset
> ```
