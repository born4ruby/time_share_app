time_share_app
==============

This is basic time share app.

Before making time share reservation, user need to enter email address. An activation email will be sent to given email address which contains activation link. Using that link user can make time share reservation.


Steps

1. Clone app on local. `git clone https://github.com/born4ruby/time_share_app.git`
2. Go to the app directory, run `bundle install`.
3. Run `rake db:create db:migrate`.
4. Run `rails s`
5. Visit `http://localhost:3000`