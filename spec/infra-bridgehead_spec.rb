require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe command('which python') do
  its(:exit_status) { should eq 0 }
end

describe command('which VBoxManage') do
  its(:exit_status) { should eq 0 }
end

describe command('which vagrant') do
  its(:exit_status) { should eq 0 }
end

describe command('which packer') do
  its(:exit_status) { should eq 0 }
end

describe command('which docker') do
  its(:exit_status) { should eq 0 }
end

describe command('which docker-machine') do
  its(:exit_status) { should eq 0 }
end

describe command('which docker-compose') do
  its(:exit_status) { should eq 0 }
end
