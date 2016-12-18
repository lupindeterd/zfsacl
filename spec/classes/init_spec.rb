require 'spec_helper'
describe 'zfsacl' do

  context 'with defaults for all parameters' do
    it { should contain_class('zfsacl') }
  end
end
