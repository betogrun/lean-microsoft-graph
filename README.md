# LeanMicrosoftGraph

Lean Microsoft Graph is a lightweight gem designed for Ruby developers who need to interact with the Microsoft Graph API. This gem bridges this gap, providing an interface with Microsoft Graph API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lean-microsoft-graph'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install lean-microsoft-graph

## Usage

To start using the LeanMicrosoftGraph gem, you need to create a client instance by providing the tenant_id, client_id, and client_secret.

### Initialize the client

```ruby
client = LeanMicrosoftGraph::Client.new(
  tenant_id: 'your_tenant_id',
  client_id: 'your_client_id',
  client_secret: 'your_client_secret'
)
```

Replace 'your_tenant_id', 'your_client_id', and 'your_client_secret' with your actual Microsoft Azure credentials.

### Count the number of users

```ruby
count = client.users.count
puts "Number of users: #{count}"
```

### Retrieving all users

```ruby
per_page = 10 # Set the number of users you want per page
users = client.users.get_all(per_page)

users.each do |user|
  puts "User ID: #{user.id}"
end
```

### Retrieving a user by id

```ruby
user_id = 'your_user_id' # Replace 'your_user_id' with the actual user id
user = client.users.get_by_id(user_id)

puts "User ID: #{user.id}"
puts "User Display Name: #{user.display_name}"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lean-microsoft-graph.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
