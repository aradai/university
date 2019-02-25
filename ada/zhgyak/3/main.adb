with Hash_Maps, Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;

procedure Main is
	
	function Hash(K: in Integer) return Positive is
	begin
		return abs(K) + 1;
	end Hash;

	package Int_Hash_Maps is new Hash_Maps(
		Key => Integer,
		Value => Character,
		Hash  => Hash,
		No_Value => '0'
	);
	use Int_Hash_Maps;

	H: Hash_Map(10);
begin

	Push(H, 3, 'a');
	Push(H, 4, 'b');
	Push(H, 3, '.');
	Push(H, -4, 'c');
	Push(H, -2, '-');
	
	Put(Size(H)); --3

end Main;