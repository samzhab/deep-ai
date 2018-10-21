require 'addressable/uri'
require 'json'
require 'byebug'
require 'rest-client'

class DeepAIAPI
  API_URL = 'https://api.deepai.org/api'
  API_KEY = ''
  CELEB_PATH = "/celebrity-recognition"
  DEMOG_PATH = "/demographic-recognition"
  NSFW_PATH = "/nsfw-detector"
  DENSECAP_PATH = "/densecap"
  PLACE_PATH = "/places"
  WAIFU2X_PATH = "/waifu2x"
  NEURALTALK_PATH = "/neuraltalk"
  SIMILARIMAGE_PATH = "/image-similarity"
  CNNMRF_PATH = "/CNNMRF"
  DEEPMASK_PATH = "/deepmask"
  COLOR_PATH = "/colorizer"
  NEURALSTYLE_PATH = "/neural-style"
  TORCH_PATH = "/torch-srgan"
  DEEPDREAM_PATH = "/deepdream"
  INPAINT_PATH = "/inpainting"

  def start
    puts '[deep-ai] DEEP AI API TESTER'
    puts '[deep-ai] ENTER YOU APIKEY'
  end

  def id_celebrity(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{CELEB_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def id_demographics(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{DEMOG_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def detect_nudity(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{NSFW_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def caption_image(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{DENSECAP_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def recognize_scene(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{PLACE_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def upscale_denoise(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{WAIFU2X_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def summerize_content(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{NEURALTALK_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def similar(image1, image2)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{SIMILARIMAGE_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image1' => image1, 'image2' => image2})
    puts JSON.parse(response)
  end

  def transfer_style(image, style_image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{CNNMRF_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'content_image' => image, 'style_image' => style_image})
    puts JSON.parse(response)
  end

  def generate_bounderies(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{DEEPMASK_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'content' => image})
    puts JSON.parse(response)
  end

  def colorize(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{COLOR_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def neural_transfer_style(image, content_image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{NEURALSTYLE_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'style' => image, 'content' => content_image})
    puts JSON.parse(response)
  end

  def enchance_resolution(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{TORCH_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

  def deep_dream(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{DEEPDREAM_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'content' => image})
    puts JSON.parse(response)
  end

  def in_paint(image)
    image = "https://static.parade.com/wp-content/uploads"\
                              "/2016/01/DenzelWashington-FTR.jpg" if image.nil?
    response = RestClient::Request.execute(method: :post,
                url: "#{API_URL}#{INPAINT_PATH}",
                timeout: 600, headers: {'api-key' => API_KEY},
                payload: {'image' => image})
    puts JSON.parse(response)
  end

end

deep_ai_obj = DeepAIAPI.new
deep_ai_obj.id_demographics nil
