class ServiceListingsController < ApplicationController
  include NotificationsHelper
  
  def index
    @service_listings = ServiceListing.all
    @service_listing_approvals = ServiceListingApproval.all
  end

  def new
    @service_listing = ServiceListing.new
    @services = Service.all # used for services dropdown
  end

  def show
    @service_listing = ServiceListing.find(params[:id])
  end
  
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    @service_listing.user_id = session[:user_id]
    
    if @service_listing.save
      puts "Service listing created!"
      redirect_to controller: 'service_listings', notice: 'Job was successfully added.'
    else
      flash[:errors] = @service_listing.errors
      redirect_to action: 'new'
    end
#    redirect_to client_path(@service_listing.user_id)
	end

  # return 
  def nearme
    msg = nil
    status = 200
    if params[:radius] == nil
      status = 500
      msg = { :errorMessage => "No \"radius\" parameter passed!"};
    else
        if validateNearMeParams(params[:radius]) < 0
          status = 500
          msg = { :errorMessage => "Radius must be between 1 and 10 km (inclusive)."};
        end
    end

    respond_to do |format|
      if !msg
        msg = { :radius => "#{params[:radius]}", :userId => current_user.id, 
        :myLat => current_user.lat, :myLon => current_user.long, :listings => [{:lat => 43.6472812, :lon => -79.4050966}]};
      end
      response.headers["Access-Control-Allow-Origin"] = "*"
      format.json {render :json => msg, :status => status}
    end
  end

  def mapView
    @current_user = current_user;
  end
	
	private

  def validateNearMeParams(radius)
    if radius.to_i < 1 || radius.to_i > 10
      return -1;
    end

    return 0;
  end

	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
	    # TODO: modify service_listing_params
    	params.require(:service_listing).permit(:service_id, :task_date, :hourly_rate, :description)
  end

end
