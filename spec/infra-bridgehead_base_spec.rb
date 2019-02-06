require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

# This psec is required by Ansible docker connection plugin.
describe file('/usr/bin/python') do
  it { should be_executable }
end

# Workaround: the result of `python --version` is sent to stderr.
# Ref. https://bugs.python.org/issue18338
describe command('python --version') do
  its(:stderr) { should match /^Python 2\.7\.(9|1\d)/ }
end

describe file('/opt') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe command('ruby --version'), :if => ENV['TARGET_HOST'].include?('wercker') do
  its(:stdout) { should match /^ruby 2\./ }
end

describe command('ruby --version'), :if => !ENV['TARGET_HOST'].include?('wercker') do
  its(:exit_status) { should_not eq 0 }
end

describe command("/bin/bash -c 'pwd'") do
  its(:exit_status) { should eq 0 }
end

describe command("ansible-playbook --version"), :if => ENV['TARGET_HOST'].include?('wercker') do
  its(:exit_status) { should eq 0 }
end

repos = [
  "bionic main restricted",
  "bionic-updates main restricted",
  "bionic universe",
  "bionic-updates universe",
  "bionic multiverse",
  "bionic-updates multiverse",
  "bionic-backports main restricted universe multiverse",
]

describe command("cat /etc/apt/sources.list"), :if => os[:family] == 'ubuntu' do
  repos.each {|r|
    its(:stdout) { should_not match /#\s+#{Regexp.escape("deb http://archive.ubuntu.com/ubuntu/ #{r}")}/ }
  }
end

describe command("cat /etc/apt/sources.list.d/ftp_jaist_ac_jp_pub_Linux_ubuntu.list"), :if => os[:family] == 'ubuntu' do
  repos.each {|r|
    its(:stdout) { should match /#{Regexp.escape("deb http://ftp.jaist.ac.jp/pub/Linux/ubuntu/ #{r}")}/ }
  }
end
