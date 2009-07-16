require 'rake'
require 'rake/contrib/sshpublisher'

files = %W{ftdetect/haml.vim ftplugin/haml.vim ftplugin/sass.vim indent/haml.vim indent/sass.vim syntax/haml.vim syntax/sass.vim}

desc "Install"
task :install do
  vimfiles = if ENV['VIMFILES']
               ENV['VIMFILES']
             elsif RUBY_PLATFORM =~ /(win|w)32$/
               File.expand_path("~/vimfiles")
             else
               File.expand_path("~/.vim")
             end

  puts "Installing rails.vim"
  files.each do |file|
    target_file = File.join(vimfiles, file)
    FileUtils.mkdir_p(File.dirname(target_file))
    FileUtils.cp(file, target_file)
    puts "  Copied #{file} to #{target_file}"
  end
end
