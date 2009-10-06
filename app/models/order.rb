class Order < ActiveRecord::Base
  has_many :links, :dependent => :destroy
  has_many :profiles, :through => :links

  validates_presence_of :title, :message => "が未入力です"
  validates_presence_of :date, :message => "が未入力です"
  validates_presence_of :time, :message => "が未入力です"

  #日付のチェック(今日より以前であればエラー)
  validates_date :date, :after => 1.days.ago( Date.today)

  #時間のチェック(現在時刻の５分後より前であればエラー)
  validates_time :time, :after => 5.minutes.from_now( Time.now)
    
end
