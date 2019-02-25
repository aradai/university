with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Printer is
task T1 is
    entry E1;
    entry E2;
end T1;
--fogadás:
--fogadja a hívást, majd nem csinál semmit, terminál
task body T1 is
begin
    accept E1;
    accept E2;
end T1;



begin
    --hívás:
    T1.E1;
end Printer;