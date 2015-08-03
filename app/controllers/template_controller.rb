class TemplateController < ApplicationController

def create
	
end


def show
	@template_number=params[:template_number]
	respond_to do |format|
		format.html


	end
		
end

end
