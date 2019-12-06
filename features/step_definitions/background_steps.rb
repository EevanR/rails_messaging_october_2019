Given("I am on the Login page") do
  visit user_session_path
end

Given("I am on the landing page") do
  visit root_path
end

Given ("I go to the sent page") do
  visit mailbox_sent_path
end
  
Given("the following user exist:") do |table|
  table.hashes.each do |hash|
    create(:user, hash)
  end
end

Given("I am in the inbox") do
  visit mailbox_inbox_path
end

Given("I am logged in as {string}") do |name|
  user = User.find_by(name: name)
  login_as(user, scope: :user)
end

Given("the following messages exist:") do |table|
  table.hashes.each do |hash|
    sender = User.find_by(name: hash[:sender])
    receiver = User.find_by(name: hash[:receiver])

    sender.send_message(receiver, hash[:message], hash[:subject])
  end
end

