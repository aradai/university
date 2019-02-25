generic
	type Item is private;
	type Index is (<>);
	type Item_Array is array(Index range <>) of Item;
	with function Condition(I: in Item) return Boolean;
procedure Filter_Value(A: in Item_Array; B: out Item_Array; N: out Natural);