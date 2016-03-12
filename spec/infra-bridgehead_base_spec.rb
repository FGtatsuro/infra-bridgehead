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

describe command('ruby --version') do
  its(:stdout) { should match /^ruby 2\./ }
end
