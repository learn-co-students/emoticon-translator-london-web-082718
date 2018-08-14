# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  hash = YAML.load_file(file_path)

  new_hash = { }
  new_hash["get_meaning"] = { }
  new_hash["get_emoticon"] = { }

  hash.each do |meaning, emoticons|
    japanese = emoticons[1]
    english = emoticons[0]
      if english && japanese
        new_hash["get_meaning"][japanese] = meaning
        new_hash["get_emoticon"][english] = japanese
      end
  end

  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  japanese_equivalent = hash["get_emoticon"][emoticon]

  if japanese_equivalent
    japanese_equivalent
  else
    "Sorry, that emoticon was not found"
  end

end


def get_english_meaning(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  english_meaning = hash["get_meaning"][emoticon]

  if english_meaning
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end

end
