require 'fileutils'

ROOT_PATH = '~/.janus'

desc "link VIM configuration files."
task :link_vim_conf_files do
  %w[ vimrc.before vimrc.after gvimrc.before gvimrc.after ].each do |file|
    dest = File.expand_path("~/.#{file}")
    if File.exist?(dest)
      puts "\tReplacing Old File: .#{file} and moving it to .#{file}.old"
      FileUtils.mv(dest, File.expand_path("~/.#{file}.old"))
    end
    File.symlink(File.expand_path("#{ROOT_PATH}/config/#{file}"), dest)
  end
end

desc "Move existing vim files to janus config dir"
task :move_existing_vim_files do
  %w[ vimrc.before vimrc.after gvimrc.before gvimrc.after ].each do |file|
    src = File.expand_path("~/.#{file}")
    dst = File.expand_path("#{ROOT_PATH}/config/#{file}")
    if File.exist?(src)
      puts "\tCopying Existing File: .#{file} and moving it to #{ROOT_PATH}/config/#{file}"
      FileUtils.mv(src, dst)
    else
      puts "Creating empty config file: #{ROOT_PATH}/config/#{file}"
      FileUtils.touch(dst)
    end
  end
end

desc "Create necessary folders"
task :folders do
  folders = %w[ config ]
  folders.each do |f|
    Dir.mkdir(File.expand_path("#{ROOT_PATH}/#{f}"))
  end
end

desc "Setup Git Repo"
task :git_setup do
  puts "Creating initial git repository"
  `git init > /dev/null`
  `touch README`
  `git add .`
  `git commit -m 'Newly created JanusConfigurationSyncer Install'`
  print "Please enter github repo URL: "
  repo = STDIN.gets
  `git remote add origin #{repo}`
  `git push -u origin master`
end


task :update do
  puts "Pulling the latest configuration"
  `git pull > /dev/null`
  puts "Updating Submodules"
  sh "git submodule foreach git pull origin master"
end

task :install_copy => [:link_vim_conf_files] do
  puts "Installing Vimrc files from config directory"
end

task :install_create => [:folders, :move_existing_vim_files, :git_setup, :install_copy] do
  puts "Creating necessary folders"
end

desc "Update Janus Config"
task :default do
  sh "rake update"
end
