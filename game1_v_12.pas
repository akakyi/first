{TODO Сделать чтение карты из файла}
Uses Crt;
var
 karta:array[0..10] of array[0..12] of string;
 pb:boolean;
 yaschik,pusto,stena,pers,pb1,element1,element2,element3:string;
 ch,fr:char;
 pos_x,pos_y,pos1,pos2,m:byte;
 g,h,s,ch1,ch2,kc1,kc2:integer;
 file1:text;
begin
 clrscr;
 stena := '#';
 yaschik := '@';
 pusto := '.';
 pers := '*';
 pb1 := '0';
 pos_y := 1;
 pos_x := 1;
 pos1 := 2;
 pos2 := 4;
 {заполнение массива карты(придумывание карты)}
 for ch1 := 0 to 10 do
 begin
  if (ch1 = 0) or (ch1 = 10) then
  begin
   for ch2 := 0 to 12 do
   karta[ch1][ch2] := stena;
  end
  else
   for ch2 := 0 to 12 do
   begin
    if (ch2 = 0) or (ch2 = 12) then karta[ch1][ch2] := stena
    else
     karta[ch1][ch2] := pusto;
   end;
 end;
 {karta[1][1] := pers;
 karta[2][4] := yaschik;
 karta[8][8] := pb1;}
 assign(file1,'/home/mhan/karta.txt');
 reset(file1);
 while not eof{end of file}(file1) do
 begin
   for m := 1 to 3 do
   begin
    read(file1,ch);
    case fr of
    'p' : element1 := pers;
    'y' : element1 := yaschik;
    'b' : element1 := pb1;
    's' : element1 := stena;
    '#' : continue;
    end;
    read(file1,ch);
    element2 := ch;
    read(file1,ch);
    element3 := ch;
    int(element2,kc1);
    {karta[element2][element3] := element1;}
   end;
 end;
 while true do
 begin
  clrscr;
  if (pb = true) then
  begin
   writeln('ПОБЕДА!!!');
   readln;
   break;
  end;
  s:=5;
  gotoxy(1,3);
  {вывод массива(карты) на экран}
  for g:=0 to 10 do
  begin
   for h:=0 to 12 do
   begin
    if h < 12 then
    begin
     write(karta[g][h]);
    end
    else
     writeln(karta[g][h]);
    end;
   end;
  repeat
   ch:=ReadKey;
  until (ch=#119) or (ch=#97) or (ch=#115) or (ch=#100) or (ch=#113);
  clrscr;
  if ch = #113 {'q' выход} then break;
  if ch = #97 {'a' движение влево} then
  begin
   if not (karta[pos_y][pos_x - 1] = stena) then
   begin
    if (karta[pos_y][pos_x - 1] = yaschik) and
    not (karta[pos_y][pos_x - 2] = stena) then
    begin
     karta[pos1][pos2] := pusto;
     pos2 := pos2 - 1;
     karta[pos1][pos2] := yaschik;
     karta[pos_y][pos_x] := pusto;
     pos_x := pos_x - 1;
     karta[pos_y][pos_x] := pers;
    end
    else
    if not (karta[pos_y][pos_x - 1] = yaschik) then
    begin
     karta[pos_y][pos_x] := pusto;
     pos_x := pos_x - 1;
     karta[pos_y][pos_x] := pers;
    end;
   end;
  end;
  if ch = #100 {'d' движение вправо} then
  begin
   if not (karta[pos_y][pos_x + 1] = stena) then
   begin
    if (karta[pos_y][pos_x + 1] = yaschik) and
    not (karta[pos_y][pos_x + 2] = stena) then
    begin
     if karta[pos_y][pos_x + 2] = pb1 then
     pb := true;
     karta[pos1][pos2] := pusto;
     pos2 := pos2 + 1;
     karta[pos1][pos2] := yaschik;
     karta[pos_y][pos_x] := pusto;
     pos_x := pos_x + 1;
     karta[pos_y][pos_x] := pers;
    end
    else
    if not (karta[pos_y][pos_x + 1] = yaschik) then
     begin
      karta[pos_y][pos_x] := pusto;
      pos_x := pos_x + 1;
      karta[pos_y][pos_x] := pers;
     end;
   end;
  end;
  if ch = #119 {'w' движение вверх} then
  begin
   if not (karta[pos_y - 1][pos_x] = stena) then
   begin
    if (karta[pos_y - 1][pos_x] = yaschik) and
    not (karta[pos_y - 2][pos_x] = stena) then
    begin
     if karta[pos_y - 2][pos_x] = pb1 then
     pb := true;
     karta[pos1][pos2] := pusto;
     pos1 := pos1 - 1;
     karta[pos1][pos2] := yaschik;
     karta[pos_y][pos_x] := pusto;
     pos_y := pos_y - 1;
     karta[pos_y][pos_x] := pers;
    end
    else
    if not (karta[pos_y - 1][pos_x] = yaschik) then
    begin
     karta[pos_y][pos_x] := pusto;
     pos_y := pos_y - 1;
     karta[pos_y][pos_x] := pers;
    end;
   end;
  end;
  if ch =#115 {'s' движение вниз} then
  begin
   if not (karta[pos_y + 1][pos_x] = stena) then
   begin
    if (karta[pos_y + 1][pos_x] = yaschik) and
    not (karta[pos_y + 2][pos_x] = stena) then
    begin
     if karta[pos_y + 2][pos_x] = pb1 then
     pb := true;
     karta[pos1][pos2] := pusto;
     pos1 := pos1 + 1;
     karta[pos1][pos2] := yaschik;
     karta[pos_y][pos_x] := pusto;
     pos_y := pos_y + 1;
     karta[pos_y][pos_x] := pers;
    end
    else
    if not (karta[pos_y + 1][pos_x] = yaschik) then
     begin
      karta[pos_y][pos_x] := pusto;
      pos_y := pos_y + 1;
      karta[pos_y][pos_x] := pers;
     end;
   end;
  end;
  {когда игрок проходит через "финиш", то "финиш" удаляется. Ниже приведено
  решение этой проблемы}
  if not (karta[8][8] = pers) and not(karta[8][8] = yaschik) then
   karta[8][8] := pb1;
 end;
end.

