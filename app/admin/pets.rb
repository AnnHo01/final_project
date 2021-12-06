ActiveAdmin.register Pet do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :description, :image_URL, :breed_id, :image

  form do |f|
    f.semantic_errors # show errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions # Adds the "submit" and "cancel" buttons
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :image, :breed_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
