gem_with_extension_example
====================================


[gem\_with\_extension\_example](http://rubygems.org/gems/gem_with_extension_example) is a functioning Ruby Gem that uses C to speed  
up the inner workings.  Please let me know if you find a way to make this better.

Cheers,  
[Sean Vikoren](http://vikoren.com)  
<sean@vikoren.com>  

<br />

Clues to making a Ruby Gem:
---------------------------

1. You will need an account on github.com.
2. You will also need an account on rubygems.org.
* To generate your rubygems.org key:  
    `curl -u rubygems_username https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials`

* Get your files all in the right spot:  
    `gem install "gem_with_extension_example"`  
     **Rename to your gem name.**

* `cd new_gem_name`
* `git init`
* `git commit -a -m "first commit"`
* `git remote add origin git@github.com:yourgithubid/your_gem_name.git`
* `git push -u origin master`

At this point make some changes to the gem and test that it works.  Don't forget to update the version!

### Local update after changing .gemspec
* `bundle update`


### Get it up to github.com
* `git rm <any removed files>`
* `git commit -a -m "updated version"`
* `git push`

### Get it up to RubyGems.org
* `gem build your_gem_name.gemspec`
* `gem push your_gem_name-1.0.0.gem`

<br />
<br />

Misc Additional Clues
---------------------
#### Build Gem
* `gem build geocoder-simplified.gemspec`

#### Install Gem
* `gem install gem_with_extension_example-0.0.0.gem`

#### Verify Installation
* `gem list | grep gem_with_extension_example`

#### Locate Installation Directory
* `gem env`

#### Local publish
* `gem 'my_gem', :git => 'http://myserver.com/git/my_gem'`

<br />
###There were many sources used to get this working, but here are a few:

* [RailsCast 245: New Gem with Bundler][].
* [ProgrammingRuby][]
* [Ruby C Extension API][]

<br />
### README.md format

The '.md' stands for [markdown][], or in this case, [github-flavored-markdown][].

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

<!-- Links -->
[gem\_with\_extension\_example]:			http://rubygems.org/gems/gem_with_extension_example
[RailsCast 245: New Gem with Bundler]:		http://railscasts.com/episodes/245-new-gem-with-bundler                            "Bundle Gem Railscast"
[markdown]:									http://github.github.com/github-flavored-markdown/                                 "Markdown"
[github-flavored-markdown]:					https://github.com/textmate/markdown.tmbundle/blob/master/Tests/test.markdown      "Git Flavored Markdown"
[ProgrammingRuby]:							http://ruby-doc.org/docs/ProgrammingRuby/html/ext_ruby.html
[Ruby C Extension API]:						http://www.eqqon.com/index.php/Ruby_C_Extension_API_Documentation_%28Ruby_1.8%29
















