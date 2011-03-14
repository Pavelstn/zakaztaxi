class TaxistController < ApplicationController
  session :off, :only => :index

  def index
    
    @zakazs= Zakaz.where( :status=>'0') unless read_fragment('unique_cache_key')
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @zakazs }
    end

  end

  def vote
    if !isvote(session[:user_id])
      @trade= Trade.new
      @trade.zakaz_id= params[:id]
      @trade.time= params[:time]
      @trade.status=0
      @trade.taxist_id= session[:user_id]
      @trade.save
      #      respond_to do |format|
      #        if @trade.save
      #           format.html { redirect_to(:action =>:index) }
      #          #format.html { head :ok}
      #          #format.xml  { render :xml => @zakaz, :status => :created, :location => @zakaz }
      #        else
      #          #format.html { render :action => "new" }
      #          #format.xml  { render :xml => @zakaz.errors, :status => :unprocessable_entity }
      #        end
    end
    redirect_to(:action =>:index)
  end




    



def list
end

private
def isvote(user_id)
  trade= Trade.where(:status=>'0', :taxist_id=> user_id).first
  if trade
    return true
  else
    return false
  end
end

end
