require "rails_helper"

RSpec.describe 'API link endpoint' do
  it 'creates a link' do
    user = log_in_user
    post '/api/v1/links', 
      params: JSON.generate(url: 'http://turing.io', title: 'Turing'), 
      headers: {'Content-Type': 'application/json'}  
    expect(response.status).to eq(201)
    expect(Link.last.title).to eq('Turing')
    expect(Link.last.user_id).to eq(user.id)
  end

  it 'returns all links for a user' do
    user = log_in_user
    link = FactoryGirl.create(:link, title: 'MyLink', user_id: user.id)

    get '/api/v1/links'
    all_links = JSON.parse(response.body)
    expect(all_links[0]['title']).to eq('MyLink')
  end
end
