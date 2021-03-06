require 'rack/jekyll'
require 'yaml'
require './_build/cachesettings'
require 'rack/deflater'

use CacheSettings, {
      /.*\.png/ => {:cache_control => "max-age=31536000, public"},
      /.*\.gif/ => {:cache_control => "max-age=31536000, public"},
      /.*\.jpg/ => {:cache_control => "max-age=31536000, public"},
      /.*\.css/ => {:cache_control => "max-age=31536000, public"},
      /.*\.js/ => {:cache_control => "max-age=31536000, public"},
      /.*\.woff/ => {:cache_control => "max-age=31536000, public"},
      /.*\.woff2/ => {:cache_control => "max-age=31536000, public"},
      /.*\.eot/ => {:cache_control => "max-age=31536000, public"},
      /.*\.svg/ => {:cache_control => "max-age=31536000, public"},
      /.*\.ttf/ => {:cache_control => "max-age=31536000, public"}
    }
use Rack::Deflater

FileUtils.touch('/tmp/app-initialized')
run Rack::Jekyll.new
