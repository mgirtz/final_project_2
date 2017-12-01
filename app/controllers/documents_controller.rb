class DocumentsController < ApplicationController
  def index
    @documents = Document.page(params[:page]).per(10)

    render("documents/index.html.erb")
  end

  def show
    @document = Document.find(params[:id])

    render("documents/show.html.erb")
  end

  def new
    @document = Document.new

    render("documents/new.html.erb")
  end

  def create
    @document = Document.new

    @document.signature_date = params[:signature_date]
    @document.signature = params[:signature]
    @document.home_id = params[:home_id]

    save_status = @document.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/documents/new", "/create_document"
        redirect_to("/documents")
      else
        redirect_back(:fallback_location => "/", :notice => "Document created successfully.")
      end
    else
      render("documents/new.html.erb")
    end
  end

  def edit
    @document = Document.find(params[:id])

    render("documents/edit.html.erb")
  end

  def update
    @document = Document.find(params[:id])

    @document.signature_date = params[:signature_date]
    @document.signature = params[:signature]
    @document.home_id = params[:home_id]

    save_status = @document.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/documents/#{@document.id}/edit", "/update_document"
        redirect_to("/documents/#{@document.id}", :notice => "Document updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Document updated successfully.")
      end
    else
      render("documents/edit.html.erb")
    end
  end

  def destroy
    @document = Document.find(params[:id])

    @document.destroy

    if URI(request.referer).path == "/documents/#{@document.id}"
      redirect_to("/", :notice => "Document deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Document deleted.")
    end
  end
end
