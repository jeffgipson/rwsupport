class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /responses
  def index
    @pagy, @responses = pagy(Response.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @responses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @responses.load

    # Uncomment to authorize with Pundit
    # authorize @responses
  end

  # GET /responses/1 or /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new

    # Uncomment to authorize with Pundit
    # authorize @response
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses or /responses.json
  def create
    @response = Response.new(response_params)

    # Uncomment to authorize with Pundit
    # authorize @response

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: "Response was successfully created." }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1 or /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1 or /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: "Response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @response
  end

  # Only allow a list of trusted parameters through.
  def response_params
    params.require(:response).permit(:title, :body, :image, :user_id, :ticket_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:response).permit(policy(@response).permitted_attributes)
  end
end
