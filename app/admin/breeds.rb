ActiveAdmin.register Breed do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :image_URL, :qty, :pet_group_id, :price, :image

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
  #   permitted = [:name, :description, :image, :qty, :pet_group_id, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
