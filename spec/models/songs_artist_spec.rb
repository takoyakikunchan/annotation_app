require 'rails_helper'
 

RSpec.describe SongsArtist, type: :model do
    before do
      @song = FactoryBot.build(:songs_artist)
      @song.image = fixture_file_upload('public/images/test_image.png')
    end
      

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it '全ての値が正しく入力されてれば保存できる' do
        expect(@song).to be_valid
      end
    end
    context '投稿が保存できない場合' do
      it '写真は1枚必須であること' do
        @song.image = nil
        @song.valid?
        expect(@song.errors.full_messages).to include("写真を登録してください")
      end
      it '曲名の情報がないと保存できない' do
        @song.name = nil
        @song.valid?
        expect(@song.errors.full_messages).to include("曲名を入力してください")
      end
      it '歌詞の情報がないと保存できない' do
        @song.text = nil
        @song.valid?
       
         expect(@song.errors.full_messages).to include("歌詞を入力してください")
      end
       it 'ジャンルの選択が「--」の時は商品は保存できない' do
        @song.genre_id = 1
         @song.valid?
         expect(@song.errors.full_messages).to include("ジャンルを選択してください")
       end
       it 'ジャンルについての情報がないと保存できない' do
         @song.genre_id = nil
         @song.valid?
         expect(@song.errors.full_messages).to include("ジャンルを入力してください")
       end
      it 'アーティストの情報がないと保存できない' do
          @song.art_name = nil
          @song.valid?
         expect(@song.errors.full_messages).to include("歌手名を入力してください")
       end

       it 'リリース日の情報がないと保存できない' do
        @song.sales_date = nil
        @song.valid?
       expect(@song.errors.full_messages).to include("リリース日を入力してください")
     end

       it '曲名が40文字以上では保存できないこと' do
         @song.name = 'a' * 50
         @song.valid?
         expect(@song.errors.full_messages).to include('曲名は40文字以内で入力してください')
       end

       it '歌手名が40文字以上では保存できないこと' do
        @song.art_name = 'a' * 50
        @song.valid?
        expect(@song.errors.full_messages).to include('歌手名は40文字以内で入力してください')
      end

      it 'プロデューサー名が40文字以上では保存できないこと' do
        @song.producer_name = 'a' * 50
        @song.valid?
        expect(@song.errors.full_messages).to include('プロデューサー名は40文字以内で入力してください')
      end

      it 'コラボアーティスト名が40文字以上では保存できないこと' do
        @song.featuring_name = 'a' * 50
        @song.valid?
        expect(@song.errors.full_messages).to include('コラボアーティスト名は40文字以内で入力してください')
      end
     end
  end
end
