require 'pamela'

Pamela.load :test

task :default => [:test]

task :console do
  exec("irb -rubygems -Ilib -rdllt")
end
