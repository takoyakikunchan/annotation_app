require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数混合であれば登録できる' do
        @user.password = 'knbn0000'
        @user.password_confirmation = 'knbn0000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'kn00'
        @user.password_confirmation = 'kn00'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'kkkkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードは英語だけだと登録できない' do
        @user.password = 'kkkkkkkk'
        @user.password_confirmation = 'kkkkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは数字だけだと登録できない' do
        @user.password = '00000000'
        @user.password_confirmation = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end


    end
  end
end
