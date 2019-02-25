procedure Filter_Value(A: in Item_Array; B: out Item_Array; N: out Natural) is
	J: Index := B'First;
begin
	N := 0;
	for I in A'range loop
		if Condition(A(I)) then
			B(J) := A(I);
			J    := Index'Succ(J);
			N    := N + 1;
		end if;
	end loop;
end Filter_Value;