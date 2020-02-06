describe 'HTTParty' do
  it 'HTTParty' do
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
    to_return(status: 200, body: "", headers: {'content-type': 'application/json'})


    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  it 'VCR' do
    VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
    end
  end

  it 'VCR Only', :vcr do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end