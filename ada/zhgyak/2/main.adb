with Filter_Value, Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;

procedure Main is

	type Int_Array is array(Positive range <>) of Integer;
	
	function Condition(I: in Integer) return Boolean is
	begin
		return I > 5;
	end Condition;
	
	procedure Int_Filter is new Filter_Value(
		Item 	   => Integer,
		Index 	   => Positive,
		Item_Array => Int_Array,
		Condition  => Condition
	);
	
	A: Int_Array(1..5) := (1, 31, 5, 7, 1);
	B: Int_Array(1..5);
	N: Natural;
begin
	Int_Filter(A, B, N);
	for I in B'First..N loop
		Put(B(I));
	end loop;
end Main;