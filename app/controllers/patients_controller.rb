class PatientsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "Personal data" do |group|
      group.add :photograph, :first_name, :last_name, :date_of_birth, :place
    end
    action.columns.add_subgroup "Parents data" do |group|
      group.add :mother, :father, :addresses, :phone_numbers, :emails
    end
    action.columns.add_subgroup "Medical data" do |group|
      group.add :referenced_by, :observations
    end
  end

  active_scaffold :patient do |conf|
    #Agregar una columna para edad
    conf.columns.add :age

    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:photograph, :last_name, :first_name, :age, :emails, :addresses, :consultations]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :consultations, :photograph_content_type, :photograph_file_name, :photograph_file_size, :photograph_updated_at

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]

    #Configuración de los agrupados por categorias para la acción create
    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show

    #Configuracion de [:date_of_birth] para que muestre mas años
    conf.columns[:date_of_birth].options = {:end_year => Date.today.year-30, :start_year => Date.today.year}

    conf.columns[:consultations].label = ""

  end
end