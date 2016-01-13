require 'nkf'

module StringNormalizer
  extend ActiveSupport::Concern

  def normalize_as_name(text)
    NKF.nkf('-w -Z1', text).strip if text
  end

  # -w: UTF-8で出力
  # -Z1: 全角の英数字、記号、全角スペースを半角に変換する
  # --katakana: ひらがなをカタカナに変換する
  def normalize_as_furigana(text)
    NKF.nkf('-w -Z1 --katakana', text).strip if text
  end
end
