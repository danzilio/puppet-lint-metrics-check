require 'spec_helper'

describe 'abc_size' do
  context 'warn when abc is above the configured warning size' do
    before do
      PuppetLint.configuration.metrics_abc_warning = 0
    end

    let(:code) do
      <<-EOS
      include foo
      EOS
    end

    it 'should have one problem' do
      expect(problems).to have(1).problems
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('assignment branch condition size is 1.0')
    end
  end

  context 'fail when abc is above the configured failure size' do
    before do
      PuppetLint.configuration.metrics_abc_error = 0
    end

    let(:code) do
      <<-EOS
      include foo
      EOS
    end

    it 'should have one problem' do
      expect(problems).to have(1).problems
    end

    it 'should create a warning' do
      expect(problems).to contain_error('assignment branch condition size is 1.0')
    end
  end

  context 'do nothing when abc is within parameters' do
    before do
      PuppetLint.configuration.metrics_abc_warning = 30
      PuppetLint.configuration.metrics_abc_error = 100
    end

    let(:code) do
      <<-EOS
      include foo
      EOS
    end

    it 'should have one problem' do
      expect(problems).to have(0).problems
    end

    it 'should create a warning' do
      expect(problems).not_to contain_error('assignment branch condition size is 1.0')
      expect(problems).not_to contain_warning('assignment branch condition size is 1.0')
    end
  end
end
