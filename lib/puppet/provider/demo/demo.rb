require 'puppet/resource_api/simple_provider'

# Implementation for the demo type using the Resource API.
class Puppet::Provider::Demo::Demo < Puppet::ResourceApi::SimpleProvider
  def resource_path
    type_name = self.class.name.split('::').last.downcase
    "/tmp/#{type_name}_resources"
  end

  def get(_context)
    resources = []
    Dir.glob("#{resource_path}/*.yml").each do |file|
      res = YAML.safe_load(File.read(file), [Symbol])
      resources << res
    end
    resources
  end

  def create(context, name, should)
    context.notice("Creating '#{name}' with #{should.inspect}")
    FileUtils.mkdir_p resource_path unless File.exist?(resource_path)
    File.open("#{resource_path}/#{name}.yml", 'w') do |file|
      file.write(should.to_yaml)
    end
  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
    File.open("#{resource_path}/#{name}.yml", 'w') do |file|
      file.write(should.to_yaml)
    end
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
    File.delete("#{resource_path}/#{name}.yml")
  end
end
