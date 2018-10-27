require 'addressable/uri'
require 'json'
require 'byebug'
require 'rest-client'

class DeepAIAPI
  API_URL = 'https://api.deepai.org/api'.freeze
  API_KEY = ''.freeze
  CELEB_PATH = '/celebrity-recognition'.freeze
  DEMOG_PATH = '/demographic-recognition'.freeze
  NSFW_PATH = '/nsfw-detector'.freeze
  DENSECAP_PATH = '/densecap'.freeze
  PLACE_PATH = '/places'.freeze
  WAIFU2X_PATH = '/waifu2x'.freeze
  NEURALTALK_PATH = '/neuraltalk'.freeze
  SIMILARIMAGE_PATH = '/image-similarity'.freeze
  CNNMRF_PATH = '/CNNMRF'.freeze
  DEEPMASK_PATH = '/deepmask'.freeze
  COLOR_PATH = '/colorizer'.freeze
  NEURALSTYLE_PATH = '/neural-style'.freeze
  TORCH_PATH = '/torch-srgan'.freeze
  DEEPDREAM_PATH = '/deepdream'.freeze
  INPAINT_PATH = '/inpainting'.freeze

  def start
    puts '[deep-ai] DEEP AI API TESTER'
    puts '[deep-ai] ENTER YOU APIKEY'
  end

  def setup_headers
    headers = {}
    headers['api-key'] = API_KEY
    headers
  end

  def setup_params_single_image(image_module, image)
    request = {}
    modulesset1 = %w[celeb demog nsfw densecap place
                     waifu2x neuraltalk colorize torch inpaint]
    modulesset2 = %w[deepdream deepmask]
    if modulesset1.include?(image_module)
      request['image'] = image
    elsif modulesset2.include?(image_module)
      request['content'] = image
    end
    request
  end

  def setup_params_two_images(image_module, image1, image2)
    request = {}
    if image_module == 'similar'
      request['image1'] = image1
      request['image2'] = image2
    elsif image_module == 'neuralstyle'
      request['style'] = image1
      request['content'] = image2
    elsif image_module == 'cnnmrf'
      request['content_image'] = image1
      request['style_image'] = image2
    end
    request
  end

  def id_celebrity(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('celeb', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{CELEB_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def id_demographics(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('demog', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{DEMOG_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def detect_nudity(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('nsfw', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{NSFW_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def caption_image(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('densecap', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{DENSECAP_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def recognize_scene(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('place', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{PLACE_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def upscale_denoise(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('waifu2x', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{WAIFU2X_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def summerize_content(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('neuraltalk', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{NEURALTALK_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def similar(image1, image2)
    if image1.nil? || image2.nil?
      image1 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
      image2 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_two_images('similar', image1, image2)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{SIMILARIMAGE_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def transfer_style(image1, image2)
    if image1.nil? || image2.nil?
      image1 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
      image2 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_two_images('cnnmrf', image1, image2)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{CNNMRF_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def generate_bounderies(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('deepmask', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{DEEPMASK_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def colorize(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('colorize', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{COLOR_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def neural_transfer_style(image1, image2)
    if image1.nil? || image2.nil?
      image1 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
      image2 = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_two_images('neuralstyle', image1, image2)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{NEURALSTYLE_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def enchance_resolution(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('torch', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{TORCH_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def deep_dream(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('deepdream', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{DEEPDREAM_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end

  def in_paint(image)
    if image.nil?
      image = 'https://static.parade.com/wp-content/uploads'\
      '/2016/01/DenzelWashington-FTR.jpg'
    end
    headers = setup_headers
    request_payload = setup_params_single_image('inpaint', image)
    response = RestClient::Request.execute(method: :post,
                                           url: "#{API_URL}#{INPAINT_PATH}",
                                           timeout: 600, headers: headers,
                                           payload: request_payload)
    puts JSON.parse(response)
  end
end

deep_ai_obj = DeepAIAPI.new
deep_ai_obj.id_demographics nil
