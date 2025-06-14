class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[ show edit update destroy ]

  # GET /tutors or /tutors.json
  def index
    @tutors = Tutor.all
  end

  # GET /tutors/1 or /tutors/1.json
  def show
  end

  # GET /tutors/new
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  def edit
  end

  # POST /tutors or /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)

    respond_to do |format|
      if @tutor.save
        format.turbo_stream
        format.html { redirect_to @tutor, notice: "Tutor criado com sucesso!" }
        format.json { render :show, status: :created, location: @tutor }
      else
         format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "tutors/form", locals: { tutor: @tutor }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1 or /tutors/1.json
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.turbo_stream
        format.html { redirect_to @tutor, notice: "Tutor atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @tutor }
      else
         format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "tutors/form", locals: { tutor: @tutor }) }  
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1 or /tutors/1.json
  def destroy
    @tutor.destroy!

    respond_to do |format|
      format.html { redirect_to tutors_path, status: :see_other, notice: "Tutor apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
      @tutor = Tutor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tutor_params
      params.expect(tutor: [ :nome, :telefone, :email, :cpf, :rg ])
    end
end
