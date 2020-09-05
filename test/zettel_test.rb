require "test_helper"

describe Zettel do
  before do
  end

  it "has version" do
    assert { ::Zettel::VERSION }
  end

  it "works fine with basic note" do
    @note = Zettel::Note.new("# Yay\n\n oops, poops\n---\na: b\n---")

    assert { @note.body == 'oops, poops' }
    assert { @note.title == 'Yay' }
    assert { @note.frontmatter == {"a" => "b"} }
  end

end
