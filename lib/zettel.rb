require_relative 'zettel/version'

module Zettel
  class Note
    attr_reader :body, :frontmatter, :title, :time
    def initialize(note, filename = nil)
      @raw_body = note

      @frontmatter, body = extract_frontmatter(note)
      title, @body = body.split("\n", 2).map(&:strip)
      @title = title.gsub('#', '').strip
      # @title = extract_title(body)

      @filename = filename
      if filename
        @extension = File.extname(filename)
        @identificator, @title = filename.gsub(/#{@extension}$/, '').split(" ", 2)
        @title = @title&.unicode_normalize || ""
        id_parts = @identificator.split('.')
        raise "Strange id - has more than two parts: #{id_parts}" if id_parts.size > 2

        @timestamp, @ordering = id_parts.reverse

        @ordering =~ /(\d+)([a-z\d]+)?/
        @leading_number = $1
        @following_number = $2

        @timestamp, @temporary_sign = @timestamp.split('_').reverse
        @time = created_at(@timestamp)
      end
    end

    private

    def created_at(timestamp)
      begin
        year = 2000 + timestamp[0..1].to_i
        month = timestamp[2..3].to_i
        day = timestamp[4..5].to_i
        hour = timestamp[6..7].to_i
        minutes = timestamp[8..9].to_i
        seconds = timestamp[10..11]&.to_i

        Time.new(year, month, day, hour, minutes, seconds)
      rescue
        nil
      end
    end

    def extract_title(md)

    end

    def extract_frontmatter(content)
      front_pattern = /\A(---\r?\n(.*?)\n?^---\s*$\n?)/m
      rear_pattern = /(---\r?\n(.*?)\n?^---)\n*\s*\z/m

      result = content =~ front_pattern || content =~ rear_pattern

      return [{}, content] unless result

      fm = YAML.load($2)
      cn = content.sub($1, "")

      return [{}, cn] unless fm

      [fm, cn]
    end
  end
end