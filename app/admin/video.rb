ActiveAdmin.register Video do
  permit_params :title, :description, :slug, :published_at, :kind

  index do
    column :id
    column :title
    column :kind
    actions
  end

  show do
    attributes_table :id, :title, :kind, :slug, :description, :published_at
    attributes_table do
      row :thumbnail do |p|
        image_tag url_for(p.thumbnail)
      end
    end
  end

  form do |f|
    f.inputs "Video" do
      f.input :title
      f.input :description
      f.input :slug
      f.input :published_at
      f.input :kind
      f.input :thumbnail, as: :file
    end
    actions
  end
end
