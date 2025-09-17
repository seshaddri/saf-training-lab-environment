# Uncomment the below lines to add gems and files required by the resource
# require ""
# require_relative ""

# Change module if required
module Inspec::Resources
  # Most custom InSpec resource inherit from a dynamic class, InSpec.resource(1).
  # If you wish to inherit from a core resource, you need to follow special instructions -
  # see https://www.chef.io/blog/extending-inspec-resources-core-resource-inheritance
  class MyCustomResource < Inspec.resource(1)
    # Every resource requires an internal name.
    name "docker_compose_config"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "linux"

    desc "Resource description ..."

    example <<~EXAMPLE
      describe "docker_compose_config" do
        its("shoe_size") { should cmp 10 }
      end
      describe "docker_compose_config" do
        it { should be_purple }
      end
    EXAMPLE

    # Resource initialization. Add any arguments you want to pass to the contructor here.
    # Anything you pass here will be passed to the "describe" call:
    # describe docker_compose_config(YOUR_PARAMETERS_HERE) do
    #   its("shoe_size") { should cmp 10 }
    # end
    def initialize
      skip_resource "The `docker_compose_config` resource is not yet available on your OS." unless inspec.os.linux?
      # Initialize required path/params/configs
    end

    # Define a resource ID. This is used in reporting engines to uniquely identify the individual resource.
    # This might be a file path, or a process ID, or a cloud instance ID. Only meaningful to the implementation.
    # Must be a string. Defaults to the empty string if not implemented.
    def resource_id
      # replace value specific unique to this individual resource instance
      "something special"
    end

    # Define how you want your resource to appear in test reports. Commonly, this is just the resource name and the resource ID.
    def to_s
      "docker_compose_config #{resource_id}"
    end

    # Define matchers. Matchers are predicates - they return true or false.
    # Matchers also have their names transformed: the question mark is dropped, and
    # the "is_" prefix becomes "be_". A similar transformation happens for "has_" (see below)
    # So this will be called as:
    #  describe "docker_compose_config" do
    #    it { should be_purple }
    #  end
    def is_purple?
      # positive or negative expectations specific to this resource instance
      true # Purple is the best color
    end

    # Define matchers. Matchers are predicates - they return true or false.
    # Matchers also have their names transformed: the question mark is dropped, and
    # the "has_" prefix becomes "have_".
    # So this will be called as:
    #  describe "docker_compose_config" do
    #    it { should have_bells }
    #  end
    def has_bells?
      # positive or negative expectations specific to this resource instance
      true # Jingle all the way
    end

    # Define properties. Properties return values for evaluation against operators.
    # No name transformation occurs. This is called using the "its" facility.
    # So this will be called as:
    #  describe "docker_compose_config" do
    #    its('shoe_size') { should cmp 42 }
    #  end
    def shoe_size
      # Implementation of a property specific to this resource
      42
    end

    private

    # Methods to help the resource's public methods
    def helper_method
      # Add anything you need here
    end
  end
end
