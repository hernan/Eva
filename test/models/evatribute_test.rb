require "test_helper"

class EvatributeTest < ActiveSupport::TestCase
  test "must have a name" do
    evatribute = Evatribute.new(name: "")

    assert_not evatribute.valid?
    assert_equal "can't be blank", evatribute.errors[:name].first
  end

  test "must have a name unique per entity" do
    evatribute1 = Evatribute.create!(name: "Test", data_type: "string", entity_type: "User")
    evatribute2 = Evatribute.new(name: "Test", data_type: "string", entity_type: "User")

    assert_not evatribute2.valid?
    assert_equal "has already been taken", evatribute2.errors[:name].first
  end

  test "can have the same name in different entities" do
    evatribute1 = Evatribute.create!(name: "Test", entity_type: "User", data_type: "string")
    evatribute2 = Evatribute.new(name: "Test", entity_type: "Product", data_type: "string")

    assert evatribute2.valid?
  end

  test "must have a data type" do
    evatribute = Evatribute.new(name: "Test", entity_type: "User")

    assert_not evatribute.valid?
    assert_equal "can't be blank", evatribute.errors[:data_type].first
  end

  test "the data type must be valid" do
    evatribute = Evatribute.new(name: "Test", entity_type: "User", data_type: "invalid")

    assert_not evatribute.valid?
    assert_equal "is not included in the list", evatribute.errors[:data_type].first
  end

  test "the data type must be valid II" do
    evatribute = Evatribute.new(name: "Test", entity_type: "User", data_type: Evatribute::DATA_TYPES.sample)

    assert evatribute.valid?
  end

  test "must have an entity type" do
    evatribute = Evatribute.new(name: "Test", data_type: "string")

    assert_not evatribute.valid?
    assert_equal "can't be blank", evatribute.errors[:entity_type].first
  end

  test "the entity type must be valid" do
    evatribute = Evatribute.new(name: "Test", entity_type: "invalid", data_type: "string")

    assert_not evatribute.valid?
    assert_equal "is not included in the list", evatribute.errors[:entity_type].first
  end

  test "the entity type must be valid II" do
    evatribute = Evatribute.new(name: "Test", entity_type: Evatribute::ENTITIES.sample, data_type: "string")

    assert evatribute.valid?
  end

  test "should set the column_name" do
    evatribute = Evatribute.new(name: "Test", entity_type: Evatribute::ENTITIES.sample, data_type: "string")

    assert evatribute.valid?
    assert_equal "test", evatribute.column_name
  end

  test "should set the column_name and dasherize" do
    evatribute = Evatribute.new(name: "Test Name", entity_type: Evatribute::ENTITIES.sample, data_type: "string")

    assert evatribute.valid?
    assert_equal "test_name", evatribute.column_name
  end
end
