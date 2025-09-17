git_dir = input('git_dir')

# The following branches should exist
# The following branches should exist
describe git(git_dir) do
  its('branches') { should include 'main' }
  its('branches') { should include 'testBranch' }
  its('current_branch') { should eq 'main' }
  its('last_commit'){ should match '/7a748c6/'} 
end

describe command("git --git-dir #{git_dir} branch --format='%(refname:short)'").stdout.lines.map(&:strip) do
  it { should include 'testBranch' }
end

# What is the current branch
describe command("git --git-dir #{git_dir} branch --show-current").stdout.strip do
  it { should eq 'main' }
end

# What is the latest commit
describe command("git --git-dir #{git_dir} log -1 --pretty=format:'%h'") do
  its('stdout') { should match /7a748c6/ }
end

# What is the second to last commit
describe command("git --git-dir #{git_dir} log --skip=1 -1 --pretty=format:'%h'") do
  its('stdout') { should match /edc207f/ }
end
