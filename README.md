###Social Auth
Requirements: Facebook, Twitter and Linkedin App tokens:
Environment variables:

  - Facebook
    - ```ENV["FACEBOOK_KEY"]```
    - ```ENV["FACEBOOK_SECRET"]```
  - Twitter
    - ```ENV["TWITTER_SECRET"]```
    - ```ENV["TWITTER_KEY"]```

  - Linkedin
    - ```ENV["LINKEDIN_KEY"]```
    - ```ENV["LINKEDIN_SECRET"]```


###Resolve dependencies

```bundle install```


###Migrations

```bundle exec rake db:migrate```

###Run

```bundle exec rails server```


### License

Software licensed under the [MIT license](http://opensource.org/licenses/MIT).