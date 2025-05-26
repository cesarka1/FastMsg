class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.turbo_stream
        format.html { redirect_to pets_path, notice: "Pet criado com sucesso." }
        format.json { render :show, status: :created, location: @pet }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "pets/form", locals: { pet: @pet }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.turbo_stream
        format.html { redirect_to @pet, notice: "Pet atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "pets/form", locals: { pet: @pet }) }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy!

    respond_to do |format|
      format.html { redirect_to pets_path, status: :see_other, notice: "Pet deletado com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.expect(pet: [ :nome, :especie, :tutor_id, :observacoes, :data_nascimento ])
    end
end
