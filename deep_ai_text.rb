require 'addressable/uri'
require 'json'
require 'byebug'
require 'rest-client'

class DeepAIAPI
  API_URL = 'https://api.deepai.org/api'.freeze
  API_KEY = ''.freeze
  SENT_PATH = '/sentiment-analysis'.freeze
  SUMM_PATH = '/summarization'.freeze
  TAGG_PATH = '/text-tagging'.freeze
  PMCP_PATH = '/parseymcparseface'.freeze

  def start
    puts '[deep-ai] DEEP AI API TESTER'
    puts '[deep-ai] ENTER YOU APIKEY'
  end

  def sentiment_analysis(text)
    # posting a text url
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{SENT_PATH}",
                                           timeout: 600,
                                           headers: { 'api-key' => API_KEY },
                                           payload: { 'text' => text })
    puts JSON.parse(response)
  end

  def text_summarization(text)
    # posting a text url
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{SUMM_PATH}",
                                           timeout: 600,
                                           headers: { 'api-key' => API_KEY },
                                           payload: { 'text' => text })
    puts JSON.parse(response)
  end

  def text_tagging(sentence)
    # posting a text url
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{TAGG_PATH}",
                                           timeout: 600,
                                           headers: { 'api-key' => API_KEY },
                                           payload: { 'sentence' => sentence })
    puts JSON.parse(response)
  end

  def parsey_mc_parseface(sentence)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{PMCP_PATH}",
                                           timeout: 600,
                                           headers: { 'api-key' => API_KEY },
                                           payload: { 'sentence' => sentence })
    puts JSON.parse(response)
  end
end

deep_ai_obj = DeepAIAPI.new
textfile = File.new('test')
deep_ai_obj.sentiment_analysis(textfile)
