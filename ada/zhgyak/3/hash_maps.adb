package body Hash_Maps is

	procedure Push(H: in out Hash_Map; K: in Key; V: in Value) is 
		I: Positive := Hash(K);
	begin
		if H.Container(I) = No_Value then
			H.Container(I) := V;
			H.Current_Size := H.Current_Size + 1;
		end if;
	end Push;
	

	function Size(H: in Hash_Map) return Natural is
	begin
		return H.Current_Size;
	end Size;

end Hash_Maps;