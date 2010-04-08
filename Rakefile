require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/sc-core-ext'

def rcov_opts
  IO.readlines("spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
end

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'sc-core-ext' do
  self.developer 'Colin MacKenzie IV', 'sinisterchipmunk@gmail.com'
  self.description = "A collection of core extensions that I have come to rely on in more than one package"
  self.readme_file = 'README.rdoc'
  self.extra_deps     = [['activesupport','>= 2.3.5']]
  self.extra_dev_deps = [['rspec','>=1.3.0'],['rcov','>=0.9.8']]
end

Rake::RDocTask.new(:docs) do |rdoc|
  files = ['README.rdoc', # 'LICENSE', 'CHANGELOG',
           'lib/**/*.rb', 'doc/**/*.rdoc']#, 'spec/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = 'README.rdoc'
  rdoc.title = 'sc-core-ext'
  rdoc.rdoc_dir = 'doc'
  rdoc.options << '--line-numbers' << '--inline-source'
end

namespace :spec do
  desc "Run all specs with rcov"
  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
    t.rcov = true
    t.rcov_dir = 'coverage'
    t.rcov_opts = rcov_opts
  end
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

remove_task :default
task :default => :spec
