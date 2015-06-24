class SearchController < ApplicationController

  def index
    @results = Movie.all

    if params[:title].present?
      @results = @results.where(["title LIKE ?", "%#{params[:title]}%"])
    end

    if params[:director].present?
      @results = @results.where(["director LIKE ?", "%#{params[:director]}%"])
    end

    #duration
    case params[:duration]
    when "Under 90"
      @results = @results.where('runtime_in_minutes < ?', 90)
    when "Between 90 and 120" 
      @results =  @results.where("runtime_in_minutes >= ? AND runtime_in_minutes <= ?", 90, 120)
    when "Over 120" 
      @results = @results.where("runtime_in_minutes > ?", 120) 
    end

    @results = @results.page(params[:page]).per(10)

  end

end


#Movie.where("title LIKE  ? ", "%%").where("director LIKE ? ", "%%").where("runtime_in_minutes ? ", "90")