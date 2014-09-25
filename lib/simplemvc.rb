require "simplemvc/version"

module Simplemvc
  class Application
    def call(env)
      if env["PATH_INFO"] == "/"
        return [302, { "Location" => "/page/about" }, []]
      end

      if env["PATH_INFO"] == "/favicon.ico"
        return [500, { }, []]
      end

      controller_class, action = get_controller_and_action(env)
      response = controller_class.new.send(action)
      [ 200, { "Content-Type" => "text/html" }, [ response ] ]
    end

    def get_controller_and_action(env)
      controller_name, action = get_page_and_action env["PATH_INFO"]
      controller_name = controller_name.capitalize + "Controller"
      [Object.const_get(controller_name), action]
    end

    def get_page_and_action(path)
      _, controller, action = path.split("/")
      [controller, action]
    end
  end
end
