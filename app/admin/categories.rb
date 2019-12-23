ActiveAdmin.register Category do
  actions :all, except: [:destroy]

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.semantic_errors
    f.inputs 'Category' do
      f.input :name
    end
    f.actions
  end
end
