require 'rails_helper'

describe String do # describeでグループ化している
    describe '#<<' do
        # 文字列の長さが4であるかどうか
        example '文字の追加' do # テストケース名
            s = "ABC"
            s << "D"
            expect(s.size).to eq(4)
        end
        # {}のコードが例外を発生させるか
        example 'nilは追加できない' do
            s = "ABC"
            s << "D"
            expect { s << nil }.to raise_error(TypeError)
        end
    end
end

=begin
    expect(T).to M
    Tはターゲット。Mはマッチャー（マッチするかどうか）と呼ぶ
=end
