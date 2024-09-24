require "json"

module SJSON
  VERSION = "0.1.0"

  def self.stringToJson(str : String)
    hash = stringToHash(str)
    hash.to_json
  end

  def self.stringToHash(str : String)
    hash = {} of String => String
    if !str.empty? && !str.nil?
        str[1..-2].split(", ").each do |pair|
            key, value = pair.split(" => ")
            key = key[1..-2] if key.starts_with?("\"") && key.ends_with?("\"")
            if value.starts_with?("\"") && value.ends_with?("\"")
                value = value[1..-2]
                hash[key] = value
            elsif value =~ /^\d+$/
                hash[key] = value.to_s
            else
                hash[key] = value
            end
          end
      end
      hash
  end
end
