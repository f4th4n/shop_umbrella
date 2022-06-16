defmodule ShopWeb.PurchaseDetailsControllerTest do
  use ShopWeb.ConnCase

  import Shop.TransactionFixtures

  alias Shop.Transaction.PurchaseDetails

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all purchase_details", %{conn: conn} do
      conn = get(conn, Routes.purchase_details_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create purchase_details" do
    test "renders purchase_details when data is valid", %{conn: conn} do
      conn = post(conn, Routes.purchase_details_path(conn, :create), purchase_details: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.purchase_details_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.purchase_details_path(conn, :create), purchase_details: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update purchase_details" do
    setup [:create_purchase_details]

    test "renders purchase_details when data is valid", %{conn: conn, purchase_details: %PurchaseDetails{id: id} = purchase_details} do
      conn = put(conn, Routes.purchase_details_path(conn, :update, purchase_details), purchase_details: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.purchase_details_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, purchase_details: purchase_details} do
      conn = put(conn, Routes.purchase_details_path(conn, :update, purchase_details), purchase_details: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete purchase_details" do
    setup [:create_purchase_details]

    test "deletes chosen purchase_details", %{conn: conn, purchase_details: purchase_details} do
      conn = delete(conn, Routes.purchase_details_path(conn, :delete, purchase_details))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.purchase_details_path(conn, :show, purchase_details))
      end
    end
  end

  defp create_purchase_details(_) do
    purchase_details = purchase_details_fixture()
    %{purchase_details: purchase_details}
  end
end
