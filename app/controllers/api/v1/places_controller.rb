class Api::V1::PlacesController<ApplicationController
  before_action :set_place,only: %i[show update destroy]
  def index
    @places=Place.all
    # render json:@places
    render json:@places.as_json(include: {images: {only: %i[id url]}})
    # render json:@places.as_json(include: :images)

    # render json:@places.as_json(include: {images: {except: %i[imageable_type imageable_id created_at updated_at]}})
    #   yeh method b use kar skte hein agar data chota hay toh 
    # render json:@places.map{|place| place.as_json(include: {images: {only: %i[id url]}})}
  end
  def create 
    @place=Place.new(place_params)
    if @place.save
      render json:@place
    else
      render json:@place.errors.full_messages ,status: :unprocessable_entity
    end
  end
  def show
    # render json:@place
    render json:@place.as_json(include: {images: {only: %i[id url]}})
    
  end
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json:@place.errors.full_messages, status: :unprocessable_entity
    end    
  end
  def destroy
    @place.destroy
    render json:{status: "success" , message: "Place has been deleted successfully"}    
  end
  private
    def set_place
      @place=Place.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        render json:{message: error.message ,status: "failed "}
    end
    def place_params 
      params.require(:place).permit(:name,:description,:latitude,:longitude,:city,:state,:country,:image_url)
    end
end  


