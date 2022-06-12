defmodule Shop.TransactionTest do
  use Shop.DataCase

  alias Shop.Transaction

  describe "purchases" do
    alias Shop.Transaction.Purchase

    import Shop.TransactionFixtures

    @invalid_attrs %{}

    test "list_purchases/0 returns all purchases" do
      purchase = purchase_fixture()
      assert Transaction.list_purchases() == [purchase]
    end

    test "get_purchase!/1 returns the purchase with given id" do
      purchase = purchase_fixture()
      assert Transaction.get_purchase!(purchase.id) == purchase
    end

    test "create_purchase/1 with valid data creates a purchase" do
      valid_attrs = %{}

      assert {:ok, %Purchase{} = purchase} = Transaction.create_purchase(valid_attrs)
    end

    test "create_purchase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transaction.create_purchase(@invalid_attrs)
    end

    test "update_purchase/2 with valid data updates the purchase" do
      purchase = purchase_fixture()
      update_attrs = %{}

      assert {:ok, %Purchase{} = purchase} = Transaction.update_purchase(purchase, update_attrs)
    end

    test "update_purchase/2 with invalid data returns error changeset" do
      purchase = purchase_fixture()
      assert {:error, %Ecto.Changeset{}} = Transaction.update_purchase(purchase, @invalid_attrs)
      assert purchase == Transaction.get_purchase!(purchase.id)
    end

    test "delete_purchase/1 deletes the purchase" do
      purchase = purchase_fixture()
      assert {:ok, %Purchase{}} = Transaction.delete_purchase(purchase)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_purchase!(purchase.id) end
    end

    test "change_purchase/1 returns a purchase changeset" do
      purchase = purchase_fixture()
      assert %Ecto.Changeset{} = Transaction.change_purchase(purchase)
    end
  end
end
