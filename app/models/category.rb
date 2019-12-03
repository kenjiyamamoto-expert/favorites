class Category < ActiveHash::Base
  include ActiveHash::Associations

  self.data = [
    {id: '', name: '選択してください'},
    {id: 1, name: "便利機能"},
    {id: 2, name: "SNS"},
    {id: 3, name:"趣味"},
    {id: 4, name: "ビジネス"},
    {id: 5, name: "買い物"},
    {id: 6, name: "その他"}
  ]
end