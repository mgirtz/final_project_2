class HomesController < ApplicationController
  def index
    @homes = Home.all

    render("homes/index.html.erb")
  end

  def show
    @home = Home.find(params[:id])

    render("homes/show.html.erb")
  end

  def new
    @home = Home.new

    render("homes/new.html.erb")
  end

  def create
    @home = Home.new

    @home.image = params[:image]
    @home.asking_price = params[:asking_price]
    @home.seller_notes = params[:seller_notes]
    @home.location = params[:location]
    @home.user_id = params[:user_id]
    @home.showing_schedule = params[:showing_schedule]
    @home.bedrooms = params[:bedrooms]
    @home.bathrooms = params[:bathrooms]
    @home.squarefeet = params[:squarefeet]
    @home.acres = params[:acres]
    @home.style = params[:style]
    @home.year_built = params[:year_built]

    save_status = @home.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/homes/new", "/create_home"
        redirect_to("/homes")
      else
        redirect_back(:fallback_location => "/", :notice => "Home created successfully.")
      end
    else
      render("homes/new.html.erb")
    end
  end

  def edit
    @home = Home.find(params[:id])

    render("homes/edit.html.erb")
  end

  def update
    @home = Home.find(params[:id])

    @home.image = params[:image]
    @home.asking_price = params[:asking_price]
    @home.seller_notes = params[:seller_notes]
    @home.location = params[:location]
    @home.user_id = params[:user_id]
    @home.showing_schedule = params[:showing_schedule]
    @home.bedrooms = params[:bedrooms]
    @home.bathrooms = params[:bathrooms]
    @home.squarefeet = params[:squarefeet]
    @home.acres = params[:acres]
    @home.style = params[:style]
    @home.year_built = params[:year_built]

    save_status = @home.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/homes/#{@home.id}/edit", "/update_home"
        redirect_to("/homes/#{@home.id}", :notice => "Home updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Home updated successfully.")
      end
    else
      render("homes/edit.html.erb")
    end
  end

  def destroy
    @home = Home.find(params[:id])

    @home.destroy

    if URI(request.referer).path == "/homes/#{@home.id}"
      redirect_to("/", :notice => "Home deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Home deleted.")
    end
  end
end
