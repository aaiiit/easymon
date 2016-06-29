module Easymon
  class LiveCheck
    def check
      check_status = rails_version_available?
      if check_status
        message = "ENABLED"
      else
        message = "DISABLED"
      end
      [check_status, message]
    end

    private

    def rails_version_available?
      Rails.version != nil
    end
  end
end
