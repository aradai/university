separate(simulation)

task body Projectile is
C1, C2 : Coord;
L: Boolean := False;
begin
            Safe_Random.Random_Coord(C1);
            Safe_Random.Random_Coord(C2);
            if Map.GetAlive(C1,C2) and then Map.GetShip(C1, C2).B /= B then
                Printer.Print("shot at" & Coord'Image (C1) & Coord'Image(C2));
                Map.GetShip(C1, C2).Hit;
                Map.SetAlive(C1, C2, L);
            else
                Printer.Print("missed shot" & Coord'Image (C1) & Coord'Image(C2));
            end if;
 end Projectile;