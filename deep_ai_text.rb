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

  def setup_params(text_module, value)
    request = {}
    modulesset1 = %w[sentiment summarization]
    modulesset2 = %w[tagging parmcpar]
    if modulesset1.include?(text_module)
      request['text'] = value
    elsif modulesset2.include?(text_module)
      request['sentence'] = value
    end
    request
  end

  def setup_headers
    headers = {}
    headers['api-key'] = API_KEY
    headers
  end

  def sentiment_analysis(text)
    headers = setup_headers
    request_payload = setup_params('sentiment', text)
    response = RestClient::Request.execute(method:  :post,
                                           url:     "#{API_URL}#{SENT_PATH}",
                                           timeout: 600,
                                           headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def text_summarization(text)
    headers = setup_headers
    request_payload = setup_params('summarization', text)
    response = RestClient::Request.execute(method:  :post,
                                           url:     "#{API_URL}#{SUMM_PATH}",
                                           timeout: 600,
                                           headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def text_tagging(_sentence)
    headers = setup_headers
    request_payload = setup_params('tagging', text)
    response = RestClient::Request.execute(method:  :post,
                                           url:     "#{API_URL}#{TAGG_PATH}",
                                           timeout: 600,
                                           headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def parsey_mc_parseface(_sentence)
    headers = setup_headers
    request_payload = setup_params('parmcpar', text)
    response = RestClient::Request.execute(method:  :post,
                                           url:     "#{API_URL}#{PMCP_PATH}",
                                           timeout: 600,
                                           headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end
end

deep_ai_obj = DeepAIAPI.new
textfile = File.new('tg1')
deep_ai_obj.sentiment_analysis(textfile)
