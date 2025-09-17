# encoding: utf-8
# copyright: 2019, The Authors

require "hashie/mash"

class DockerComposeConfig < Inspec.resource(1)

  name 'docker_compose_config'

  def initialize(path)
    @path = path
    @yaml = inspec.yaml(path)
  end

  def services
    Hashie::Mash.new(@yaml['services'])
  end

end