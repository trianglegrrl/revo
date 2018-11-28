module UsersHelper
  def datepicker_input form, field
    form.date_field(field,
                    class: 'form-control',
                    placeholder: 'MM/DD/YYYY',
                    required: true
                   )
  end
end
