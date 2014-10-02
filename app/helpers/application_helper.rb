module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Roadnottaken"      
    end
  end
end
