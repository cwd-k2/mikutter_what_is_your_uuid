Plugin.create :what_is_your_uuid do
  class Plugin::Mastodon::Account
    attr_accessor :parsed_name
    def name
      if @parsed_name == nil
        name = self.display_name.dup

        self.fields.each do |field|
          name.gsub!("${#{field.name}}", field.value)
        end

        @parsed_name = name
      end

      return @parsed_name
    end
  end
end
