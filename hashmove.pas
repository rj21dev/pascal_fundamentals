program HashMoving;
uses crt;
const
	sqr_side = 10;
	DelayDuration = 100;

type
	hash = record
		CurX, CurY, dx, dy, range: integer;
	end;

procedure DrawSqr(x, y, side_len: integer);
var
	i, j: integer;
begin
	GotoXY(x, y);
	for i := 1 to side_len do
	begin
		for j := 1 to side_len do
			write('*');
		GotoXY(x, y + i)
	end;
	GotoXY(1, 1)
end;

procedure ShowHash(var h: hash);
begin
	GotoXY(h.CurX, h.CurY);
	write('#');
	GotoXY(1, 1)
end;

procedure HideHash(var h: hash);
begin
	GotoXY(h.CurX, h.CurY);
	write(' ');
	GotoXY(1, 1)
end;

procedure HashMove(var h: hash);
begin
	HideHash(h);
	h.CurX := h.Curx + h.dx;
	h.CurY := h.CurY + h.dy;
	ShowHash(h)
end;

procedure HashMoveRange(var h: hash);
var
	i: integer;
begin
	for i := 1 to h.range + 1 do
	begin
		HashMove(h);
		delay(DelayDuration)
	end
end;

var
	x, y: integer;
	h: hash;
begin
	if (ScreenHeight < 12) or (ScreenWidth < 12) then
	begin
		writeln('Error. Too small screen size.');
		halt(1)
	end;
	clrscr;
	x := (ScreenWidth - sqr_side) div 2;
	y := (ScreenHeight - sqr_side) div 2;
	h.CurX := x - 1;
	h.CurY := y - 1;
	h.range := sqr_side;
	ShowHash(h);
	DrawSqr(x, y, sqr_side);
	repeat
		h.dx := 1;
		h.dy := 0;
		HashMoveRange(h);
		h.dx := 0;
		h.dy := 1;
		HashMoveRange(h);
		h.dx := -1;
		h.dy := 0;
		HashMoveRange(h);
		h.dx := 0;
		h.dy := -1;
		HashMoveRange(h);
	until KeyPressed;
	clrscr
end.
