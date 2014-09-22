require 'skr/access'

module Skr
    module Demo

        class Extension < Workspace::Extension
            load_after Skr::Access::WorkspaceExtension

            self.identifier   = 'demo'
            self.logical_path = 'skr/extensions/demo'
            self.asset_path   = Pathname.new(__FILE__).dirname.join("../../../js").realpath

            def bootstrap_data(view)
                { name: view.session[:name] || '', email: view.session[:email] || '' }
            end
        end

    end

end
