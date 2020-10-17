ActiveAdmin.register Project do
  permit_params :name, :description, :thumbnail, :url

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs 'Article' do
      f.input :name
      f.input :description
      f.input :url
      f.input :thumbnail, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :url
      row :thumbnail do |p|
        image_tag url_for(p.thumbnail)
      end
    end
  end
end
