require "rails_admin_export_to_xls/engine"

module RailsAdminExportToXls
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class ExportToXls < Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :object_level do
          true
        end

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :bulkable? do
          true
        end

        register_instance_option :link_icon do
          'icon-download'
        end

        register_instance_option :controller do
          proc do
            if format = params[:xls]
              request.format = format
              @objects = list_entries(@model_config, :export)
              header, encoding, output = XLSConverter.new(@objects, @schema).to_xls(params[:csv_options])
              if params[:send_data]
                send_data output,
                  type: "application/excel; charset=#{encoding}; #{'header=present' if header}",
                  disposition: "attachment; filename=#{params[:model_name]}_#{DateTime.now.strftime('%Y-%m-%d_%Hh%Mm%S')}.xls"
              else
                render text: output
              end
            else
              render @action.template_name
            end
          end
        end
      end
    end
  end
end

