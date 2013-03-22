require './ui_helper'

def welcome
  puts "Welcome to the Github email client."
  command_line
end

def command_line
  input = nil
  until input == 'exit'
    print "main:>> "
    input = gets.chomp
    case input
    when 'compose'
      compose_message
    when 'unsubscribes'
      unsubscribes
    when 'inbox'
      inbox
    when 'drafts'
      delete
    when 'exit'
      exit
    else
      invalid
    end
  end
end

def compose_message
  input = nil
  until input == 'send'
    print "compose:>> "
    input = gets.chomp
    case input
    when 'to'
      print "to: "
      to = gets.chomp
    when 'subject'
      print "subject: "
      subject = gets.chomp
    when 'text'
      print "text: "
      text = gets.chomp
    when 'send'
      sent_message = Message.send_it({:to => to , :from => 'epicodus@foobar2.epicodus.mailgun.org' , :subject => subject , :text => text})
      if sent_message.successful?
        puts "Success! Your message was sent to #{sent_message.to}."
      else
        puts "Error! Your message was not sent to #{sent_message.to}."
        return
      end
    else
      puts "Invalid"
    end
  end
end

def unsubscribes
  input = nil
  until input == 'send'
    print "unsubscribes:>> do: "
    input = gets.chomp
    case input
    when 'list'
      puts Unsubscribe.all
    when 'add'
      print "address?:>> add: "
      address = gets.chomp
    when 'remove'
      print "address?:>> remove: "
      Unsubscribe.
    when 'check'
      print "address?:>> check: "
      text = gets.chomp
    when 'send'
      sent_message = Message.send_it({:to => to , :from => 'epicodus@foobar2.epicodus.mailgun.org' , :subject => subject , :text => text})
      if sent_message.successful?
        puts "Success! Your message was sent to #{sent_message.to}."
      else
        puts "Error! Your message was not sent to #{sent_message.to}."
        return
      end
    else
      puts "Invalid"
    end
  end


end




welcome