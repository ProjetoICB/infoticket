class Log < ActiveRecord::Base

  attr_accessible :acao, :ip

  belongs_to :usuario

end
