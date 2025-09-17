# copyright: 2018, The Authors

describe docker_compose_config('docker-compose.yml') do
  its('services.operatingsystem.image') { should eq 'redhat/ubi9' }
  its('services.nginx.image') { should cmp 'nginx:latest' }
end