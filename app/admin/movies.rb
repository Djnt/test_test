ActiveAdmin.register Movie do
  actions :all

  permit_params :text, :title, :category_id

  index do
    selectable_column
    id_column
    column :title
    column :text
    column :category
    column :raiting
    actions
  end

  filter :title
  filter :text
  filter :category

  form do |f|
    f.semantic_errors
    f.inputs 'Movie' do
      f.input :title
      f.input :text
      f.input :category
    end
    f.actions
  end
end
