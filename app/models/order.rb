class Order < ActiveRecord::Base
  has_many :links, :dependent => :destroy
  has_many :profiles, :through => :links

  validates_presence_of :title, :message => "タイトルが未入力です"
  validates_presence_of :date, :message => "日付が未入力です"
  validates_presence_of :time, :message => "時間が未入力です"
end
