require 'spec_helper'

ensure_module_defined('Puppet::Provider::Demo')
require 'puppet/provider/demo/demo'
require 'tmpdir'

RSpec.describe Puppet::Provider::Demo::Demo do
  subject(:provider) { described_class.new }

  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }
  let(:typedef) { instance_double('Puppet::ResourceApi::TypeDefinition', 'typedef') }

  before(:all) do
    type_name = described_class.name.split('::').last.downcase
    temp_dir = Dir.mktmpdir
    @resource_path = "#{temp_dir}/#{type_name}_resources"
  end

  after(:all) do
    FileUtils.remove_dir(@resource_path)
  end

  before(:each) do
    allow(provider).to receive(:resource_path).and_return(@resource_path)
    allow(context).to receive(:notice)
    # byebug
  end

  describe 'create(context, name, should)' do
    it 'creates the resource a' do
      expect(context).to receive(:notice).with(%r{\ACreating 'a'})

      provider.create(context, 'a', name: 'a', ensure: 'present')
    end
    it 'creates the resource b' do
      expect(context).to receive(:notice).with(%r{\ACreating 'b'})

      provider.create(context, 'b', name: 'b', ensure: 'present')
    end
  end

  describe 'update(context, name, should)' do
    it 'updates the resource foo' do
      expect(context).to receive(:notice).with(%r{\AUpdating 'foo'})

      provider.update(context, 'foo', name: 'foo', ensure: 'present')
    end
  end

  describe 'delete(context, name, should)' do
    it 'deletes the resource a' do
      expect(context).to receive(:notice).with(%r{\ADeleting 'a'})

      provider.delete(context, 'a')
    end
  end

  describe '#get' do
    it 'still has resources b and foo' do
      # byebug
      expect(provider.get(context)).to eq [
        {
          name: 'b',
          ensure: 'present',
        },
        {
          name: 'foo',
          ensure: 'present',
        },
      ]
    end
  end
end
