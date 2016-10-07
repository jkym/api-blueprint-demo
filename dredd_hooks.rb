require 'json'
require 'dredd_hooks/methods'

include DreddHooks::Methods

response_stash = {}

def get_input_user(transaction, response_stash)
  # reusing data from previous response here
  parsed_body = JSON.parse response_stash['users action > Create user']['body']
  machine_id = parsed_body['id']
  # replacing id in URL with stashed id from previous response
  transaction['fullPath'].gsub! '1', machine_id.to_s
end

after 'users action > Create user' do |transaction|
  # saving HTTP response to the stash
  response_stash[transaction['name']] = transaction['real']
end

before 'user action > Get user' do |transaction|
  get_input_user(transaction, response_stash)
end

before 'user action > Update user' do |transaction|
  get_input_user(transaction, response_stash)
end

before 'user action > Delete user' do |transaction|
  get_input_user(transaction, response_stash)
end

def get_input_post(transaction, response_stash)
  # reusing data from previous response here
  parsed_body = JSON.parse response_stash['posts action > Create post']['body']
  machine_id = parsed_body['id']
  # replacing id in URL with stashed id from previous response
  transaction['fullPath'].gsub! '1', machine_id.to_s
end

after 'posts action > Create post' do |transaction|
  # saving HTTP response to the stash
  response_stash[transaction['name']] = transaction['real']
end

before 'post action > Get post' do |transaction|
  get_input_post(transaction, response_stash)
end

before 'post action > Update post' do |transaction|
  get_input_post(transaction, response_stash)
end

before 'post action > Delete post' do |transaction|
  get_input_post(transaction, response_stash)
end

