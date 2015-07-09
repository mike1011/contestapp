class ReportPdf < Prawn::Document

  def initialize(products,current_account)
    super()
    @products = products
    @current_account=current_account
    header_text
    #logo

    #header
    ##text_content
    table_content
    thanks_message
  end
 
  # def header
  #   #This inserts an image in the pdf file and sets the size of the image
  #   ##image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  #   image "#{Rails.root}/app/assets/images/background.jpg", width: 530, height: 150
  # end
 
  # def text_content
  #   # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
  #   y_position = cursor - 50
 
  #   # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
  #   bounding_box([0, y_position], :width => 270, :height => 300) do
  #     text "Lorem ipsum", size: 15, style: :bold
  #     text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
  #   end
 
  #   bounding_box([300, y_position], :width => 270, :height => 300) do
  #     text "Duis vel", size: 15, style: :bold
  #     text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
  #   end
 
  # end


  #   def logo
  #   #logopath =  "#{Rails.root}/app/assets/images/shopify-logo.png"
  #   #image logopath, :width => 70, :height => 70
  #   ##move_down 10
  #   #draw_text "Shopease", :at => [220, 575], size: 22

  # end

  def header_text
    text "Shopease", :size => 30, :style => :bold 
    move_down 10
    text "Orders for #{@current_account.shopify_shop_name.capitalize}"
    move_down 10
    
  end

 
  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end
 
  def product_rows
    [['#', 'Name', 'Created At']] +
      @products.map do |product|
      [product.id, product.name, product.created_at.strftime("%a,%m/%d/%Y")]
    end
  end

  def thanks_message
    move_down 80
    text "Thank you for using Shopease"
    ##move_down 15
    # text "Thank you for using Shopease",
    # :indent_paragraphs => 40, :size => 13
  end


end