# Envar

Envar is a small shim between the ENV variables which are a pain to
mock, and your app which needs to act differently according to
environments. Under the covers Envar uses the Dotenv gem, which loads
environmental variables from a .env file in your development
environment. Envar does not so much, but it does it in a way that makes
your life much easier!

## Installation

Add this line to your application's Gemfile:

    gem 'envar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install envar

## Usage

### With Rails:

Envar was built to just work with Rails. If you are running in a
development or a test environment, Envar will auto-load the .env file.
Those variables will be available on the top level constant:

With the `Rails.env = 'development'` and a .env file like so:

    FACEBOOK_TOKEN=fb-for-life-YO

Variables from the .env file will be loaded into the ENV variables
space. Even better, the top level Envar space provides a helpful shim
for accessing these variables so that you don't have to get all angle
brackety.

    Envar.facebook_token
    # => fb-for-life-YO

    # or the uglier uppercase version, if you prefer
    Envar.FACEBOOK_TOKEN
    # => fb-for-life-YO

This is a lot easier to work with in tests. For example, in rspec it
looks like this:

    Envar.stub(:facebook_token).and_return('my_great_token')

In ordinary circumstances you would need to set the ENV variables or
assume in test knowlege about the .env variable. Or worse, stub out the
:[] angle bracket methods. Try not to barf a little in your mouth if you
are in that ugly situation. Instead, be happy with Envar.

For extra configuration stuff, checkout the section below that details
what to do without some Rails.

### Without Rails:

Set the Envar environment by hand:

    Envar::Config.environment = 'development' # or whatever

The development and test environment will trigger the loading of the
local .env file. In other environments it is expected that you will have
real environmental variables set.

If you find you would rather set .env files in other environments, you
can configure which environments should load the .env file:

    Envar::Config.load_environments = ['development', 'staging']
    # => ['development', 'staging']

    # or to modify the defaults which are ['development', 'test']

    Envar::Config.load_environments << ['staging']
    # => ['development', 'test', 'staging']

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
