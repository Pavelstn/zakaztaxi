class ZakazsController < ApplicationController
  # GET /zakazs
  # GET /zakazs.xml
  def index
    user_id= session[:user_id]
    #    @zakazs= Zakaz.where(:disp_id=>user_id.to_s, :status=>'0').all

    #@zakazs = Zakaz.all
    @zakazs = Zakaz.find(:all, :conditions=>"disp_id="+user_id.to_s)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zakazs }
      format.json  { render :json => @zakazs }
      
    end
  end

  # GET /zakazs/1
  # GET /zakazs/1.xml
  def show
    @zakaz = Zakaz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zakaz }
    end
  end

  # GET /zakazs/new
  # GET /zakazs/new.xml
  def new
    @zakaz = Zakaz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zakaz }
    end
  end

  # GET /zakazs/1/edit
  def edit
    @zakaz = Zakaz.find(params[:id])
  end

  # POST /zakazs
  # POST /zakazs.xml
  def create

    @zakaz = Zakaz.new(params[:zakaz])
    @zakaz.disp_id= session[:user_id]
    @zakaz.status='0'

    respond_to do |format|
      if @zakaz.save
        format.html { redirect_to(:action =>:mainpanel) }
        format.xml  { render :xml => @zakaz, :status => :created, :location => @zakaz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zakaz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zakazs/1
  # PUT /zakazs/1.xml
  def update
    @zakaz = Zakaz.find(params[:id])
#    redirect_to( :action =>:mainpanel)
    respond_to do |format|
      if @zakaz.update_attributes(params[:zakaz])
#        # format.html { redirect_to(@zakaz, :notice => 'Zakaz was successfully updated.') }
        format.html { redirect_to( :action =>:mainpanel) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @zakaz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zakazs/1
  # DELETE /zakazs/1.xml
  def destroy
    @zakaz = Zakaz.find(params[:id])
    @zakaz.destroy

    respond_to do |format|
      format.html { redirect_to(zakazs_url) }
      format.xml  { head :ok }
    end
  end

  def mainpanel
    user_id= session[:user_id]
    
    @zakaz = Zakaz.new
#    @zakazs = Zakaz.find(:all, :conditions=>"disp_id="+user_id.to_s)
    @zakazs= Zakaz.where(:disp_id=>user_id.to_s, :status=>'0')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zakazs }
      format.json  { render :json => @zakazs }
    end
  end

end
