class PatientsController < ApplicationController

  def self.add_sub_groups (action)
    action.columns.add_subgroup "Personal data" do |group|
      group.add :photograph, :first_name, :last_name, :date_of_birth, :origin
    end
    action.columns.add_subgroup "Parents data" do |group|
      group.add :mother, :father, :addresses, :phone_numbers, :emails
    end
    action.columns.add_subgroup "Medical data" do |group|
      group.add :referenced_by, :observations
    end
  end

  active_scaffold :patient do |conf|
    #Configuración de las columnas que se mostrarán al listar
    conf.list.columns = [:photograph, :last_name, :first_name, :emails, :addresses]

    #Configuración de las columnas que se excluiran para todas las acciones
    conf.columns.exclude :created_at, :updated_at, :consultations, :photograph_content_type, :photograph_file_name, :photograph_file_size, :photograph_updated_at

    #Configuración de las acciones que se mostrarán
    conf.actions = [:create, :search, :update, :delete, :show, :nested, :subform, :list]

    #Configuración de los agrupados por categorias para la acción create
    add_sub_groups conf.create
    add_sub_groups conf.update
    add_sub_groups conf.show

    #conf.columns[:photograph].form_ui = :paperclip
  end
end