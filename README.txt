gem_with_extension_example is a functioning gem that uses C to speed up the inner workings.
Please let me know if you find a way to make this better.

Cheers,
Sean Vikoren
sean@vikoren.com



Clues to making a Ruby Gem:

# You will need an account on rubygems.org and github.com
# To generate your rubygems.org key:
curl -u rubygems_username https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials

# After Getting Files all in the right spot
# Use (gem "gem_with_extension_example", "~> 0.0.2.2") or roll your own
cd new_gem_name
git init
git commit -a -m "first commit"

# For local update after changing .gemspec
bundle update

<make some changes to the gem and test that it works>
<update the version>
git rm <any removed files>
git commit -a -m "updated version"

# Put it up on github.com
git remote add origin git@github.com:yourgithubid/your_gem_name.git
git push -u origin master

# Get it up to RubyGems.org
gem build your_gem_name.gemspec
gem push your_gem_name-1.0.0.gem



Misc Additional Clues

# Gem Building and Installation
gem build geocoder-simplified.gemspec                           # build gem
gem install gem_with_extension_example-0.0.0.gem    # install gem
gem list | grep gem_with_extension_example                # verify installation of gem
gem env                                                                       # locate installation directory

# Local publish
gem 'my_engine', :git => 'http://myserver.com/git/my_engine'

# C Extension
http://rubygems.org/gems/gem_with_extension_example
http://ruby-doc.org/docs/ProgrammingRuby/html/ext_ruby.html
http://www.eqqon.com/index.php/Ruby_C_Extension_API_Documentation_%28Ruby_1.8%29

There were many sources used to get this working, but here are a couple:
# Following the 'bundle gem' method
http://railscasts.com/episodes/245-new-gem-with-bundler

