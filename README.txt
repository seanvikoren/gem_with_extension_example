gem_with_extension_example is a functioning gem that uses C to speed up the inner workings.

Please let me know if you find a way to make this better.

Cheers,
Sean Vikoren
sean@vikoren.com


Here are some clues to making this into a gem:
sean:gem_with_extension_example sean$ git commit -a -m "updated version"
sean:gem_with_extension_example sean$ git push
sean:gem_with_extension_example sean$ gem build gem_with_extension_example.gemspec
sean:gem_with_extension_example sean$ gem push gem_with_extension_example-0.0.2.gem

# For local update after changing .gemspec
bundle update

# Gem Building and Installation
gem build gem_with_extension_example.gemspec        # build gem
gem install gem_with_extension_example-0.0.0.gem    # install gem
gem list | grep gem_with_extension_example          # verify installation of gem
gem env                                             # locate installation directory

# Publishing a gem
you will need an account on rubygems.org and github.com

# Local publish
gem 'my_engine', :git => 'http://myserver.com/git/my_engine'

There were many sources used to get this working, but here are a couple:

# Following the 'bundle gem' method
http://railscasts.com/episodes/245-new-gem-with-bundler

# C Extension
http://ruby-doc.org/docs/ProgrammingRuby/html/ext_ruby.html
http://www.eqqon.com/index.php/Ruby_C_Extension_API_Documentation_%28Ruby_1.8%29

