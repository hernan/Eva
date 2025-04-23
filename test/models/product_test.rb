require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "must have a name" do
    product = Product.new

    assert_not product.valid?
    assert_includes product.errors[:name], "can't be blank"
  end

  test "must have a sku" do
    product = Product.new(name: "Test Product")

    assert_not product.valid?
    assert_includes product.errors[:sku], "can't be blank"
  end

  test "must have a valid sku" do
    product = Product.new(name: "Test Product", sku: "AB-C123")

    assert product.valid?
  end

  test "must have a valid sku of max length 20 chars" do
    product = Product.new(name: "Test Product", sku: "ABC12345678901234567")

    assert product.valid?
  end

  test "must fail if the sku is too long" do
    product = Product.new(name: "Test Product", sku: "ABC12345678901234567890")

    assert_not product.valid?
    assert_includes product.errors[:sku], "is too long (maximum is 20 characters)"
  end

  test "must normalize the sku to uppercase" do
    sku = "abc123"
    product = Product.new(name: "Test Product", sku: sku)

    assert product.valid?
    assert_equal sku.upcase, product.sku
  end
end
