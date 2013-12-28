require 'spec_helper'

describe Envar, 'as an enivornment accessor' do
  before do
    Envar::Config.environment = 'test' # for autoloading of Dotenv
  end

  it "loads Dotenv when appropriate" do
    Envar.facebook_token
    ENV['FACEBOOK_TOKEN'].should_not be_nil
  end

  it "returns the value of the env variable" do
    Envar.facebook_token.should == 'fb-for-life-YO'
  end

  it "works with upcase calls too" do
    Envar.FACEBOOK_TOKEN.should == 'fb-for-life-YO'
  end
end
