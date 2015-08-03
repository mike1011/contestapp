class FeedbacksController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

def generate_pdf
	Rails.logger.info "=================Generate pdf========================"
   respond_to do |format|
   	format.html
    format.pdf do
        html = render_to_string(:file=>"feedbacks/show.html.erb")
        # html = render_to_string(
        #   :partial => "orders/timely_orders.html.erb",
        #   :locals => { :quote => @quote}
        #   )
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/bootstrap.min.css"
        send_data(kit.to_pdf, :filename => 'report.pdf', :type => 'application/pdf', :disposition => 'inline')

    end
  end
end


end
