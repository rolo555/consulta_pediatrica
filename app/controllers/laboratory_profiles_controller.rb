class LaboratoryProfilesController < ApplicationController
  # GET /laboratory_profiles
  # GET /laboratory_profiles.xml
  def index
    @laboratory_profiles = LaboratoryProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratory_profiles }
    end
  end

  # GET /laboratory_profiles/1
  # GET /laboratory_profiles/1.xml
  def show
    @laboratory_profile = LaboratoryProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @laboratory_profile }
    end
  end

  # GET /laboratory_profiles/new
  # GET /laboratory_profiles/new.xml
  def new
    @laboratory_profile = LaboratoryProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @laboratory_profile }
    end
  end

  # GET /laboratory_profiles/1/edit
  def edit
    @laboratory_profile = LaboratoryProfile.find(params[:id])
  end

  # POST /laboratory_profiles
  # POST /laboratory_profiles.xml
  def create
    @laboratory_profile = LaboratoryProfile.new(params[:laboratory_profile])

    respond_to do |format|
      if @laboratory_profile.save
        format.html { redirect_to(@laboratory_profile, :notice => 'LaboratoryProfile was successfully created.') }
        format.xml  { render :xml => @laboratory_profile, :status => :created, :location => @laboratory_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @laboratory_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laboratory_profiles/1
  # PUT /laboratory_profiles/1.xml
  def update
    @laboratory_profile = LaboratoryProfile.find(params[:id])

    respond_to do |format|
      if @laboratory_profile.update_attributes(params[:laboratory_profile])
        format.html { redirect_to(@laboratory_profile, :notice => 'LaboratoryProfile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laboratory_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratory_profiles/1
  # DELETE /laboratory_profiles/1.xml
  def destroy
    @laboratory_profile = LaboratoryProfile.find(params[:id])
    @laboratory_profile.destroy

    respond_to do |format|
      format.html { redirect_to(laboratory_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
