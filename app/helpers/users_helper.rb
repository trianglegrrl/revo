module UsersHelper
  def datepicker_input form, field
    form.text_field(field,
                    class: 'form-control',
                    placeholder: 'YYYY-MM-DD',
                    required: true,
                    data: {
                      provide: 'datepicker'
                    }
                   )
  end
end
