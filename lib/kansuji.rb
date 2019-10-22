KANJI_DICT = {"#{10**52}" => "恒河沙", "#{10**48}" => "極", "#{10**44}" => "載", "#{10**40}" => "正",
              "#{10**36}"=> "澗", "#{10**32}"=>"溝", "#{10**28}" => "穣", "#{10**24}" => "𥝱",
              "#{10**20}"=> "垓", "#{10**16}" => "京", "#{10**12}" => "兆", "#{10**8}" => "億", 
              "10000" => "万", "1000" => "千","100" => "百", "10" => "十", "9" => "九", "8" => "八",
              "7" => "七", "6" => "六", "5" => "五", "4" => "四", "3" => "三", "2" => "二", "1" => "一"}  

def to_kansuji(int)
  return "零" if int == 0
  KANJI_DICT.each do |num, name|
    a = num.to_i
    if int <= 10
      return name if int == a
    elsif (int / a).positive?
      return  name if int % a == 0 && int <= 1000 && int / a <= 1
      return to_kansuji(int / a) + name if int % a == 0 
      return to_kansuji(int - int % a) + to_kansuji(int % a)
    end
  end
end

def to_number(string)
  KANJI_DICT.each do |num, name|
    a = num.to_i
    return 0 if string.to_s == '零' || string.to_s == ''
    return a if string.to_s == name && a < 10
    if (string.include? name)
      return a + to_number(string.sub!(name, '')) if string.index(name) == 0
      return to_number(string.split(name)[0]) * a + to_number(string.split(name)[1])
    end
  end
end
puts to_number('零')


