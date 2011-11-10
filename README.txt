# Based on 'bundle gem'
http://railscasts.com/episodes/245-new-gem-with-bundler

# C Extension
http://ruby-doc.org/docs/ProgrammingRuby/html/ext_ruby.html
http://www.eqqon.com/index.php/Ruby_C_Extension_API_Documentation_%28Ruby_1.8%29
cd ext
ruby extconf.rb
make

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