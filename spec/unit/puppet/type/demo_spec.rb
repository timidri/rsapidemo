require 'spec_helper'
require 'puppet/type/demo'

RSpec.describe 'the demo type' do
  it 'loads' do
    expect(Puppet::Type.type(:demo)).not_to be_nil
  end
end
