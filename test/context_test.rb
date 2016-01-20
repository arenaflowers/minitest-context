require 'minitest/autorun'
require 'minitest/context'

$counter = 1

class ContextTest < MiniTest::Test
  extend MiniTest::Context

  def setup
    @a = 1
  end

  def test_outside_context # 1
    assert_equal 2, $counter += 1, 'Test in outside scope should be run only once'
  end

  context 'b' do
    def setup
      @b = 1
    end

    def test_sans_super # 2
      assert_nil @a
      assert @b
      assert_nil @c
    end
  end

  context 'c' do
    def setup
      super
      @c = 1
    end

    def test_with_super  # 3
      assert @a
      assert_nil @b
      assert @c
    end
  end

  context 'Nested' do
    def setup
      super
      @b = 2
    end

    def test_nested_sets # 4
      assert_equal 1, @a
      assert_equal 2, @b
      assert_nil @c
    end

    context 'Nested level 2' do
      def setup
        super
        @c = 3
      end

      def test_nested_sets # 5
        assert_equal 1, @a
        assert_equal 2, @b
        assert_equal 3, @c
      end
    end
  end
end
