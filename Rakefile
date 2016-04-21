require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  hosts = [
    {
      :name     =>  'localhost',
      :role     =>  'buildenv',
      :backend  =>  'exec'
    },
    {
      :name     =>  'container',
      :role     =>  'base',
      :backend  =>  'docker'
    },
    {
      :name     =>  'container_withruby',
      :role     =>  'base',
      :backend  =>  'docker'
    }

  ]
  if ENV['SPEC_TARGET'] then
    target = hosts.select{|h|  h[:name] == ENV['SPEC_TARGET']}
    hosts = target unless target.empty?
  end

  task :all     => hosts.map{|h|  "spec:#{h[:name]}"}
  task :default => :all

  hosts.each do |host|
    desc "Run serverspec tests to #{host[:name]}(backend=#{host[:backend]})"
    RSpec::Core::RakeTask.new(host[:name].to_sym) do |t|
      ENV['TARGET_HOST'] = host[:name]
      ENV['SPEC_TARGET_BACKEND'] = host[:backend]
      t.pattern = "infra-bridgehead_#{host[:role]}_spec.rb"
    end
  end
end
