defmodule ProgTaxTest do
  use ExUnit.Case
  doctest ProgTax

  describe "get taxes owed tests" do
    test "tax on $0" do
      assert ProgTax.tax(0) == 0
    end

    test "tax on $10_000" do
      assert ProgTax.tax(10_000) == 0
    end

    test "tax on $10_009" do
      assert ProgTax.tax(10_009) == 0
    end

    test "tax on $10_010" do
      assert ProgTax.tax(10_010) == 1
    end

    test "tax on $12_000" do
      assert ProgTax.tax(12_000) == 200
    end

    test "tax on $56_789" do
      assert ProgTax.tax(56_789) == 8_697
    end

    test "tax on $1_234_567" do
      assert ProgTax.tax(1_234_567) == 473_326
    end
  end
end
