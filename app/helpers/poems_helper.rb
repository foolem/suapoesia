module PoemsHelper

  def remove_accents(text)
    return text if text.blank?
    text = text.gsub(/(á|à|ã|â|ä)/, 'a').gsub(/(é|è|ê|ë)/, 'e').gsub(/(í|ì|î|ï)/, 'i').gsub(/(ó|ò|õ|ô|ö)/, 'o').gsub(/(ú|ù|û|ü)/, 'u')
    text = text.gsub(/(Á|À|Ã|Â|Ä)/, 'A').gsub(/(É|È|Ê|Ë)/, 'E').gsub(/(Í|Ì|Î|Ï)/, 'I').gsub(/(Ó|Ò|Õ|Ô|Ö)/, 'O').gsub(/(Ú|Ù|Û|Ü)/, 'U')
    text = text.gsub(/ñ/, 'n').gsub(/Ñ/, 'N')
    text = text.gsub(/ç/, 'c').gsub(/Ç/, 'C')
    text.downcase
  end

  

end
