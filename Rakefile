require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

def rcov_opts
  IO.readlines("spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "sc-core-ext"
    gem.summary = %Q{A collection of core extensions that I have come to rely on in more than one package}
    gem.description = %Q{A collection of core extensions that I have come to rely on in more than one package}
    gem.email = "sinisterchipmunk@gmail.com"
    gem.homepage = "http://github.com/sinisterchipmunk/sc-core-ext"
    gem.authors = ["Colin MacKenzie IV"]
    gem.add_dependency 'activesupport', '>= 2.3.5'
    gem.add_development_dependency 'rspec', '>=1.3.0'
    gem.add_development_dependency 'rcov',  '>=0.9.8'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  t.rcov = false
end

Spec::Rake::SpecTask.new(:rcov) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  t.rcov = true
  t.rcov_dir = 'coverage'
  t.rcov_opts = rcov_opts
end

task :default => [:check_dependencies, :spec]

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sc-core-ext #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
