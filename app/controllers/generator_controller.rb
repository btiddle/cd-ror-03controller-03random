class GeneratorController < ApplicationController

  def generate
    if session[:count]
        session[:count] += 1
    else
        session[:count] = 1
    end
    flash[:count] = session[:count]
    
    @word = Array.new(14){rand(36).to_s(36)}.join.upcase
  end

  def reset
    session.delete :count
    redirect_to('/generator/generate')
  end

end