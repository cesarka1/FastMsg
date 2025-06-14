class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: %i[ show edit update destroy ]

  # GET /agendamentos or /agendamentos.json
  def index
    @agendamentos = Agendamento.all
  end

  # GET /agendamentos/1 or /agendamentos/1.json
  def show
  end

  # GET /agendamentos/new
  def new
    @agendamento = Agendamento.new
  end

  # GET /agendamentos/1/edit
  def edit
  end

  # POST /agendamentos or /agendamentos.json
  def create
    @agendamento = Agendamento.new(agendamento_params)

    respond_to do |format|
      if @agendamento.save
        format.turbo_stream
        format.html { redirect_to @agendamento, notice: "Agendamento was successfully created." }
        format.json { render :show, status: :created, location: @agendamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendamentos/1 or /agendamentos/1.json
  def update
    respond_to do |format|
      if @agendamento.update(agendamento_params)
        format.turbo_stream
        format.html { redirect_to @agendamento, notice: "Agendamento was successfully updated." }
        format.json { render :show, status: :ok, location: @agendamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendamentos/1 or /agendamentos/1.json
  def destroy
    @agendamento.destroy!

    respond_to do |format|
      format.html { redirect_to agendamentos_path, status: :see_other, notice: "Agendamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agendamento
      @agendamento = Agendamento.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def agendamento_params
      params.expect(agendamento: [ :data_hora, :observacoes, :pet_id, :veterinario_id ])
    end
end
