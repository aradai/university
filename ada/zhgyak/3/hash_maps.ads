generic
	type Key is private;
	type Value is private;
	with function Hash(K: in Key) return Positive;
	No_Value: Value;
package Hash_Maps is

	type Hash_Map(Capacity: Natural) is limited private;

	procedure Push(H: in out Hash_Map; K: in Key; V: in Value);
	function Size(H: in Hash_Map) return Natural;
	
private

	type Value_Array is array(Positive range <>) of Value;
	type Hash_Map(Capacity: Natural) is record
		Container: Value_Array(1..Capacity) := (others => No_Value);
		Current_Size: Natural := 0;
	end record;

end Hash_Maps;