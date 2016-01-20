# Minitest::Context

Provide a simple way to add a context and common setup to minitest
tests.

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-context'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-context

## Usage

Inside your test helper add a line:

`MiniTest::Test.extend MiniTest::Context`

Then you can use a #context method to setup (and teardown) shared
context eg.

```
class SampleTest < MiniTest::Test
  def setup
    @a = true
  end
  
  context 'SampleWithInheritance' do
    def setup
      super
      @b = true
    end
    
    def test_a_and_b_are_set
      assert @a
      assert @b
    end
  end

  context 'Sample WithoutInheritance' do
    def setup
      @b = true
    end
    
    def test_only_b_is_set
      assert @b
      assert_nil @a
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
