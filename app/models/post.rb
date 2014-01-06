class Post < ActiveRecord::Base
  validates :text, 
    presence: true, length: {minimum: 5, too_short: '%{count}の長さは違います、一番短いのは５です。'}
  def to_param
    created_at.strftime('%Y/%m/%d')
  end
end
