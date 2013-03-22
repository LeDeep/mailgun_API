require 'spec_helper'

describe Message do 

  let(:attributes) {{:to => 'to@email', :from => 'epicodus@foobar2.epicodus.mailgun.org', :subject => 'test', :text => 'this is a test'}}
  let(:send_stub) {stub_request(:post, "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/messages").
    with(:body => attributes).
    to_return(:status => 200)}

  context '#initialize' do 
    it 'initializes with attributes for the email object' do 
      message = Message.new(attributes)
      message.should be_an_instance_of Message
    end
  end

  context 'attr_readers' do
    it 'returns the text of the message' do
      message = Message.new(attributes)
      message.text.should eq attributes[:text]
    end

    it 'returns the to of the message' do
      message = Message.new(attributes)
      message.to.should eq attributes[:to]
    end
    it 'returns the from of the message' do
      message = Message.new(attributes)
      message.from.should eq attributes[:from]
    end
    it 'returns the subject of the message' do
      message = Message.new(attributes)
      message.subject.should eq attributes[:subject]
    end
  end

  context '#send_it' do
    it 'sends the damn email' do
      stub = send_stub
      message = Message.new(attributes)
      Message.send_it(attributes)
      stub.should have_been_requested
    end

    it 'returns a message object with the same attributes' do 
      stub = send_stub
      message = Message.new(attributes)
      sent_message = Message.send_it(attributes)
      sent_message.should be_an_instance_of Message
    end
  end

  context '#successful?' do
    it 'returns false when message has not been sent' do
      stub = send_stub
      message = Message.new(attributes)
      message.successful?.should be_false
    end

    it 'returns true when message is sent successfully' do
      stub = send_stub
      message = Message.new(attributes)
      sent_message = Message.send_it(attributes)
      sent_message.successful?.should be_true
    end
  end


end