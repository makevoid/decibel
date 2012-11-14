path = File.expand_path "../../", __FILE__
require "#{path}/lib/simple_article_format"

FIXTURES = [
  {
    source: "
a: foo
b: bar
---
c: bla
d: lol
---
  ",
    entities: [
      { a: "foo", b: "bar" },
      { c: "bla", d: "lol" },
    ]
  },
  {
    source: "
---
a: foo
b: bar
---
c: bla
d: lol
  ",
    entities: [
      { a: "foo", b: "bar" },
      { c: "bla", d: "lol" },
    ]
  },
  {
    source: "
a: foo
b: bar
c>
long
long
text
<
---
d: baz
e>
long
long
text
<
f>
long2
long2
text2
<
g: lol
  ",
    entities: [
      { a: "foo", b: "bar", c: "long\nlong\ntext" },
      { d: "baz", e: "long\nlong\ntext", f: "long2\nlong2\ntext2", g: "lol" },
    ]
  },
]

describe "SimpleArticleFormat" do

  it "should parse entities" do
    FIXTURES.each do |fixture|
      result = SimpleArticleFormat.new(fixture[:source]).parse
      result.should == fixture[:entities]
    end
  end

end