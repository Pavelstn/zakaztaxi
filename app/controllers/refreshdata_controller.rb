class RefreshdataController < ApplicationController
  def index

  end

  def refresh
    # nu ochen vlom pisat slognyi SQL zapros
    @trades= Trade.where( :status=>'0')
    @trades.each do |trade_|
      # puts trade_.created_at
      if trade_.created_at < 1.minute.ago
        @trade = Trade.find(trade_)
        @trade.status=1
        @trade.save

        @zakaz = Zakaz.find(trade_.zakaz_id)
        @zakaz.status= 3
        @zakaz.save
      end

    end
    respond_to do |format|
      #          if @trade.save
      #format.html { redirect_to( :action =>:index) }
      format.html { head :ok}

    end
  end

  private

  def auction
    # strashnyi SQL zapros
    #SELECT  taxist_id, id, min(time) FROM trades WHERE zakaz_id=186 GROUP BY time HAVING min(created_at) limit 1
    # s ego pomoshyou budem vibirat pobeditelya auktsiona
  end

end
