require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bishl"
  gem.homepage = "http://github.com/dsci/bishl"
  gem.license = "MIT"
  gem.summary = %Q{Ruby wrapper for bishl.de xml api.}
  gem.description = %Q{Ruby wrapper for bishl.de xml api.}
  gem.email = "dsci@code79.net"
  gem.authors = ["Daniel Schmidt"]
  gem.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.textile",
    "Rakefile",
    "VERSION",
    "lib/bishl.rb",
    "lib/parser.rb",
    "lib/params_builder.rb",
    "lib/url.rb",
    "lib/errors.rb",
    "lib/schedule_line.rb",
    "lib/schedule_team.rb",
    "lib/html_helper.rb",
    "rails/init.rb",
    "init.rb",
    "spec/bishl_spec.rb",
    "spec/spec_helper.rb",
    "spec/params_builder_spec.rb",
    "spec/form_helper_spec.rb",
    "spec/parser_spec.rb",
    "spec/url_spec.rb"
  ]
  gem.add_runtime_dependency "nokogiri"
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bishl #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
