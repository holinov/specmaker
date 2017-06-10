class AjaxController < ApplicationController
  def group_labels
    # format.jsonr do
    #   render :json => {
    #       :status => :ok,
    #       :message => "Success!",
    #       :html => "...insert html..."
    #   }.to_json
    # end

    respond_to do |format|
      format.json  {
        list = Group.selectable.to_json
        puts(list)
        render :json =>list
      }
    end
  end

  def entry_labels
  end
end
