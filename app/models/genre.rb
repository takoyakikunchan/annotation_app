class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'JPOP' },
    { id: 3, name: 'ロック' },
    { id: 4, name: 'ヒップホップ' },
    { id: 5, name: 'R&B' },
    { id: 6, name: 'KPOP' },
    { id: 7, name: 'メタル' },
    { id: 8, name: 'アイドル' },
    { id: 9, name: 'アニメ・ゲーム' },
    { id: 10, name: 'EDM' },
    { id: 11, name: '洋楽pop' },
    { id: 12, name: '洋楽hiphop' },
    { id: 13, name: '洋楽ロック' },
    { id: 14, name: 'その他' }
  ]
end
