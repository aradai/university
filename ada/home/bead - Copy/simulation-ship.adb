separate(simulation)

task body Ship is
    Alive: Boolean :=True;
    Force, Feel: Coord;
begin
    while Alive loop
        if ID.all = "Luke" then
            Safe_Random.Random_Coord(Force);
            Safe_Random.Random_Coord(Feel);
            if Feel = Force then
                Printer.Print("Luke feel the Force! " & Coord'Image(Force) & Coord'Image(Feel));
                Imperial.Destroy;
                Alive := False;
            else
                Printer.Print("Luke still a padawan "  & Coord'Image(Force) & Coord'Image(Feel));
            end if;
        else
            select
                accept Hit do
                    if B'Callable then
                        B.Ship_Lost;
                        Alive := False;
                    end if;
                end Hit;
            or
                accept Call_Back do
                    Alive := False;
                end Call_Back;
            or
                delay 0.5;
                declare
                    PA: Projectile_Access := new Projectile(B);
                begin
                    --Printer.Print(ID.all & " shot one");
                    null;
                end;     
            end select;
        end if;
    end loop;
end Ship;