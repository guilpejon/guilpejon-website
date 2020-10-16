ActiveAdmin.register Article do
  permit_params :title, :content, :published_at

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    column :created_at
    actions
  end

  filter :title
  filter :published_at
  filter :created_at

  form do |f|
    f.inputs 'Article' do
      f.input :title
      f.input :published_at
      li do
        label :content, class: 'trix-editor-label'
        f.rich_text_area :content
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :content do
        div resource.content
      end
    end
  end
end