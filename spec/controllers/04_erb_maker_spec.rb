require_relative '../spec_helper'
require 'erb'

describe 'ErbMaker Middleware' do
  def app
    ErbMaker.new(Application.new)
  end
  
  it_behaves_like "an ok request"

  it 'renders an ERB template' do
    ERB.any_instance.stub(:result).and_return("text")
    expect_any_instance_of(ERB).to receive(:result)
    get '/'
  end
end