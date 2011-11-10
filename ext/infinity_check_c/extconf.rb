require 'mkmf' # for generating makefiles for Ruby extensions

extension_name = 'infinity_check_c'
dir_config(extension_name)
create_makefile(extension_name)