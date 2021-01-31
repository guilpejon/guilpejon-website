ActiveAdmin.register Image do
  permit_params :name, :orientation, :file

  index do
    column :id
    column :name
    column :orientation
    actions
  end

  show do
    attributes_table :id, :name, :orientation
    attributes_table do
      row :file do |p|
        image_tag url_for(p.file)
      end
    end
  end

  form do |f|
    f.inputs "Image" do
      f.input :name
      f.input :orientation
      f.input :file, as: :file
    end
    actions
  end
end
