KANJI = { (10**52).to_s => '恒河沙', (10**48).to_s => '極', (10**44).to_s => '載',
          (10**40).to_s => '正', (10**36).to_s => '澗', (10**32).to_s => '溝',
          (10**28).to_s => '穣', (10**24).to_s => '𥝱', (10**20).to_s => '垓',
          (10**16).to_s => '京', (10**12).to_s => '兆', (10**8).to_s => '億',
          '10000' => '万', '1000' => '千', '100' => '百', '10' => '十',
          '9' => '九', '8' => '八', '7' => '七', '6' => '六', '5' => '五',
          '4' => '四', '3' => '三', '2' => '二', '1' => '一' }.freeze

def to_kansuji(input)
  return '零' if input.zero?

  KANJI.each do |k, v|
    if input <= 10
      return v if input == k.to_i
    elsif (input / k.to_i).positive?
      return v if (input % k.to_i).zero? && input <= 1000 && input / k.to_i <= 1
      return to_kansuji(input / k.to_i) + v if (input % k.to_i).zero?

      return to_kansuji(input - input % k.to_i) + to_kansuji(input % k.to_i)
    end
  end
end

def to_number(word)
  KANJI.each do |k, v|
    return 0 if word.to_s == '零' || word.to_s == ''
    return k.to_i if word.to_s == v && k.to_i < 10

    next unless word.include? v
    return k.to_i + to_number(word.sub!(v, '')) if word.index(v).zero?

    word_split = word.split(v)
    return to_number(word_split[0]) * k.to_i + to_number(word_split[1])
  end
end
