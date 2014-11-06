# This class stores entries and classify its keys.
class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(params = {})
    if params.is_a? String
      @entries[params] = nil
      @keywords << params
    else
      @entries[params.keys.first] = params.values.first
      @keywords << params.keys.first
    end
  end

  def include?(param)
    @keywords.include? param
  end

  def find(what)
    return @entries if @entries.empty?
    @entries.select { |key, _| key.match what }
  end

  def keywords
    @keywords.sort
  end

  def printable
    result = ''
    @entries.sort_by { |k, _| k }.each do |k, v|
      result << "[#{k}] \"#{v}\"\n"
    end
    result.slice(0..-2)
  end
end
