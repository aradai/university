separate(simulation)
protected body Safe_Random is
    procedure Random_Coord(C: out Coord) is
    begin
        Coord_Random.Reset(G);
        C:= Coord_Random.Random(G);
    end Random_Coord;
end Safe_Random;