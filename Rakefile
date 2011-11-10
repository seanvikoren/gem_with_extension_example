require 'bundler/gem_tasks'
#require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

#require 'rake/extensiontask'
require 'rake'

GEM_NAME = 'gem_with_extension_example'

spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.platform = Gem::Platform::RUBY
  s.extensions = FileList["ext/**/extconf.rb"]
end

# add your default gem packing task
Rake::GemPackageTask.new(spec) do |pkg|
end

Rake::ExtensionTask.new do |ext|
  ext.name = 'infinity_check_c'               # indicate the name of the extension.
  ext.ext_dir = 'ext/infinity_check_c'        # search for 'hello_world' inside it.
  ext.lib_dir = 'lib/#{GEM_NAME}'             # put binaries into this folder.
  ext.config_script = 'extconf.rb'            # use instead of the default 'extconf.rb'.
  ext.tmp_dir = 'tmp'                         # temporary folder used during compilation.
  ext.source_pattern = "*.{c,cpp}"            # monitor file changes to allow simple rebuild.
  ext.config_options << ''                    # supply additional options to configure script.
  ext.gem_spec = spec                         # optionally indicate which gem specification will be used.
end


