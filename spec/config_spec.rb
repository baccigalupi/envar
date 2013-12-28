require 'spec_helper'

describe Envar::Config do
  before do
    Envar::Config.reset
  end

  it 'allows setting of the current environment' do
    Envar::Config.environment.should be_nil
    Envar::Config.environment = 'development'
    Envar::Config.environment.should == 'development'
  end

  describe 'autoloading environments' do
    it 'defaults to test and development' do
      Envar::Config.load_environments.should =~ ['development', 'test']
    end

    it 'defaults can be modified' do
      Envar::Config.load_environments << 'staging'
      Envar::Config.load_environments.should =~ ['development', 'staging', 'test']
    end

    it "allows complete overriding of load environments" do
      Envar::Config.load_environments = ['staging']
      Envar::Config.load_environments.should == ['staging']
    end
  end

  describe '.load?' do
    it "will be true if the environment is in the load environments" do
      Envar::Config.environment = 'test'
      Envar::Config.load?.should == true
    end

    it 'will be false otherwise' do
      Envar::Config.environment = 'foo'
      Envar::Config.load?.should == false
    end
  end

  describe '.load' do
    context 'when the current environment is one of the load environments' do
      before do
        Envar::Config.environment = 'test'
        Dotenv.stub(:load)
      end

      it "should load the Dotenv" do
        Dotenv.should_receive(:load)
        Envar::Config.load
      end

      it "should mark itself as loaded" do
        Envar::Config.load
        Envar::Config.loaded?.should == true
      end

      context 'after it has been loaded at least once' do
        before do
          Envar::Config.load
        end

        it "will not try to reload the Dotenv" do
          Dotenv.should_not_receive(:load)
          Envar::Config.load
        end
      end
    end

    context "when the environment should not be autoloaded" do
      before do
        Envar::Config.environment = 'foo'
      end

      it 'should not try to load the Dotenv' do
        Dotenv.should_not_receive(:load)
        Envar::Config.load
      end
    end
  end
end
