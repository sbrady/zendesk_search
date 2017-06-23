require 'json'
class JsonParser

  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    file = File.read(@file_path)
    JSON.parse(file).map{|hash| symbolize_keys(hash)}
  end

  private
  def symbolize_keys(hash)
    hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

end
