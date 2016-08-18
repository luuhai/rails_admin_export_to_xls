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
      end
    end
  end
end

