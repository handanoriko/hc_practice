# インターフェイス
module NameService
  def change_name(new_name)
    puts '不適切な名前です' if new_name == 'うんこ'
    @name = new_name
  end

  def get_name
    puts @name
  end
end
